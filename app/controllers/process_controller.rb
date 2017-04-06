class ProcessController < ApplicationController
    include SimpleStomp::Helper
    include SimpleStomp
    RAILS_ROOT = Rails.root
    def show_train
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    def create
        # 如果点击分享,创建一个process_information
        @process_information = ProcessInformation.create(create_params)
        # 临时的保存参数的地方
        @test_algorithm = TestAlgorithm.create(:param1 => @param1)
        @test_algorithm.process_information = @process_information
        @test_algorithm.save
        # 保存权限
        is_shared_sample_input = params[:save_input] == "no" ? false : true
        @shared_process_privilege = SharedProcessPrivilege.create(:execute_department_id =>share_department_params[:share_department_id] , :is_shared_sample_input => is_shared_sample_input, :process_id=>@process_information.id)

        # 保存是否分享文件
        @process_information.upload_file = @upload_file
        @process_information.save

        redirect_to history_use_case_path
    end


    def execute
        @workflow_id = params[:running_param][:workflow_id]
        @param1 = params[:running_param][:num]
        timestamp = Time.now.to_f.to_s
        cond = {timestamp: timestamp, workflow_id: 3, param1: @param1}
        msg = {body: cond.to_json}
        recv = send_receive msg, dest: "run_case", dest_reply: "run_case.reply", timelimit:1
        case recv['status']
        when 'ok'
            #c.status = recv[c.id.to_s]['status'] if c.status != :finished
            @process_id = recv["process_id"]
        else # error
            @err_msg = recv['error']
        end
        @refresh_info = recv
        redirect_to process_execute_path(:workflow_id => @workflow_id, :active_page => "running")
    end

    def show_execute
        @workflow_information = WorkflowInformation.find(params[:workflow_id])
        @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}
        @share_department_choice = DepartmentInformation.first.id

        if params[:active_page] == "running"
            @refresh_info = receive dest_reply: "INFO"
        end
    end


    def upload
        uploaded_io = params[:upload][:file]
        filename = upload_file(uploaded_io)
        # TODO 把文件存入数据库
        @upload_file = UploadFile.create(:name => filename, :path => filename)

        redirect_to process_execute_path(:workflow_id => params[:upload][:workflow_id], :active_page => "param")
    end

    private
    def upload_file(file) 
        if !file.original_filename.empty? 
            @filename = file.original_filename
            FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
            #向dir目录写入文件 
            File.open("#{RAILS_ROOT}/public/upload/#{@filename}", "wb") do |f| 
                f.write(file.read) 
            end 
            #返回文件名称，保存到数据库中 
            return @filename 
        end 
    end 

    def get_file_name(filename) 
        if !filename.nil? 
            require 'uuidtools' 
            filename.sub(/.*./,UUID.random_create.to_s+'.') 
        end 
    end 
    def create_params
        params.require(:process_information).permit(:name, :description, :workflow_information_id)
    end
    def share_department_params
        params.require(:process_information).permit(:share_department_id)
    end
end

