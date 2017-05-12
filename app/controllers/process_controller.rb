class ProcessController < ApplicationController
    before_action :authenticate_user!
    include SimpleStomp::Helper
    include SimpleStomp
    RAILS_ROOT = Rails.root
    def show_train
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    def update
        # 保存权限
        @process_id = params[:process_information][:process_id]
        @process_information = ProcessInformation.find(@process_id)
        @process_information.update(update_params)
        @process_information.is_shared = true
        @process_information.save

        is_shared_sample_input = params[:save_input] == "no" ? false : true
        @shared_process_privilege = SharedProcessPrivilege.create(:execute_department_id =>share_department_params[:share_department_id] , :is_shared_sample_input => is_shared_sample_input, :process_id => @process_id)
        redirect_to workflow_information_path(@process_information.workflow_information_id) 
    end

    def execute
        # 从数据库中读出process
        @process_id = params[:running_param][:process_id]
        @process_information = ProcessInformation.find(@process_id)
        workflow_id = @process_information.workflow_information_id

        # TODO 现在暂时将算法参数简单的保存一下, 以后修改
        @param1 = params[:running_param][:num]
        if @process_information.test_algorithm != nil
            TestAlgorithm.delete(@process_information.test_algorithm.id)
        end
        @test_algorithm = TestAlgorithm.create(:param1 => @param1, :process_information_id => @process_information.id)

        # 文件的路径
        @upload_file = @process_information.upload_file
        filepath = @process_information.upload_file == nil ? "" : @process_information.upload_file.path

        # 发送运行请求
        timestamp = Time.now.to_f.to_s
        cond = {timestamp: timestamp, workflow_id: workflow_id, param1: @param1, process_id: @process_id, file_path: filepath}
        msg = {body: cond.to_json}
        recv = send_receive msg, dest: "run_case", dest_reply: "run_case.reply", timelimit: 1
        case recv['status']
        when 'ok'
            #c.status = recv[c.id.to_s]['status'] if c.status != :finished
            @process_id = recv["process_id"]
        else # error
            @err_msg = recv['error']
        end

        # TODO 修改显示的信息
        @refresh_info = recv
        redirect_to process_execute_path(@process_id, :active_page => "running")
    end

    # post to create
    def create
        @process_information = ProcessInformation.create(:workflow_information_id => create_params, :is_shared => false)
        redirect_to process_execute_path(@process_information.id, :active_page => "input")
    end

    def copy
        @process_information = ProcessInformation.find(params[:process_id])

        @test_algorithm = @process_information.test_algorithm
        @upload_file = @process_information.upload_file
        @shared_process_privilege = @process_information.shared_process_privilege

        @test_algorithm_hash = @test_algorithm.attributes
        @upload_file_hash = @upload_file.attributes
        @shared_process_privilege_hash = @shared_process_privilege.attributes
        @test_algorithm_hash.delete("id")
        @upload_file_hash.delete("id")
        @shared_process_privilege_hash.delete("id")

        @new_process_information = ProcessInformation.create(:workflow_information_id => @process_information.workflow_information_id, :is_shared => false)
        @test_algorithm_hash[:process_information_id] = @new_process_information.id
        @upload_file_hash[:process_information_id] = @new_process_information.id
        @shared_process_privilege_hash[:process_id] = @new_process_information.id

        TestAlgorithm.create(@test_algorithm_hash)
        UploadFile.create(@upload_file_hash)
        # 拷贝的process没有分享功能
        # 是否显示分享的process不是靠外面的表,而是靠is_shared控制
        SharedProcessPrivilege.create(@shared_process_privilege_hash)

        redirect_to process_execute_path(@new_process_information.id, :active_page => "input")
    end

    def show_execute
        @process_information = ProcessInformation.find(params[:process_id])
        @workflow_information = @process_information.workflow_information
        @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}

        if not @process_information.shared_process_privilege == nil
            @show_share = false
            @show_input_choice = @process_information.shared_process_privilege.is_shared_sample_input
        else
            @share_department_choice = DepartmentInformation.first.id
            @show_share = true
            @show_input_choice = false
        end

        @upload_file_name = @process_information.upload_file == nil ? "" : @process_information.upload_file.name
        @param1 = @process_information.test_algorithm == nil ? "" : @process_information.test_algorithm.param1
        @process_result = @process_information.process_result == nil ? "" : @process_information.process_result.body.gsub(/\n/, "\n"=> "<br/>")
        @process_output_file = @process_information.download_file == nil ? "" : @process_information.download_file.path
        @process_percentage = 0;
        @all_percentage = 7

        # TODO 修改显示的信息
        if params[:active_page] == "running"
            @refresh_params = receive dest_reply: "INFO"
            if @refresh_params["status"] == "ok"
                if @refresh_params.has_key?"cnt"
                    @refresh_info = @refresh_params["EventReprestion"]
                    if @refresh_info == "EndOf(1)"
                        @process_percentage = 1
                    elsif @refresh_info == "Initialized(3)"
                        @process_percentage = 3
                    elsif @refresh_info == "Started(3)"
                        @process_percentage = 4
                    elsif @refresh_info == "EndOf(3)"
                        @process_percentage = 5
                    elsif @refresh_info == "Initialized(2)"
                        @process_percentage = 6
                    elsif @refresh_info == "EndOf(2)"
                        @process_percentage = 7
                    end
                else
                    @process_percentage = 2
                    @refresh_info = "Processing"
                    if @refresh_params["procedure"] == "label result"
                        result = @refresh_params["detail"]["finalClusterCentroids"]
                        output_file_name = @refresh_params["detail"]["resultFileName"]
                        DownloadFile.create(:path => output_file_name, :process_information_id => @process_information.id)
                        ProcessResult.create(:body => result, :process_information_id => @process_information.id)
                    end
                end
            else
                @refresh_info = @refresh_params["status"]
                redirect_to process_execute_path(@process_information.id, :active_page => "output")
            end
        end
    end


    def upload
        @process_information = ProcessInformation.find(params[:upload][:process_id])
        if params[:commit] == "Upload"
            uploaded_io = params[:upload][:file]
            filename, filepath = upload_file(uploaded_io)
            @upload_file = UploadFile.create(:name => filename, :path => filepath)
            if @process_information.upload_file != nil
                UploadFile.delete(@process_information.upload_file.id)
            end
            @process_information.upload_file = @upload_file
            @process_information.save
        elsif params[:commit] == "Submit"
            @upload_file = @process_information.upload_file
        else
            redirect_to process_execute_path(@process_information.id, :active_page => "input")
        end
        redirect_to process_execute_path(@process_information.id, :active_page => "param")
    end

    def download
        @process_information = ProcessInformation.find(params[:download][:process_id])
        if params[:commit] == "Download"
            download_file(@process_information.download_file.path)
        elsif params[:commit] == "Next"
            redirect_to process_execute_path(@process_information.id, :active_page => "share")
        end
    end


    private
    def create_params
        params.require(:workflow_information_id)
    end

    def upload_file(file) 
        if !file.original_filename.empty? 
            @filename = file.original_filename
            FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
            #向dir目录写入文件 
            @filepath = "#{RAILS_ROOT}/public/upload/#{@filename}"

            File.open(@filepath, "wb") do |f| 
                f.write(file.read) 
            end 
            #返回文件名称，保存到数据库中 
            return [@filename, @filepath]
        end 
    end 
    def download_file(file_path)
        if File.exist?(file_path)
            io = File.open(file_path)
            io.binmode
            send_data(io.read)
            io.close
        else
            redirect_to system_uploadfiles_path, :notice => '文件不存在，下载失败！'
        end
    end

    def get_file_name(filename) 
        if !filename.nil? 
            require 'uuidtools' 
            filename.sub(/.*./,UUID.random_create.to_s+'.') 
        end 
    end 

    def update_params
        params.require(:process_information).permit(:name, :description)
    end

    def share_department_params
        params.require(:process_information).permit(:share_department_id)
    end
end
