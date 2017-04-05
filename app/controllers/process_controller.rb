class ProcessController < ApplicationController
    include SimpleStomp::Helper
    include SimpleStomp
    RAILS_ROOT = Rails.root
    def show_train
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    def create
        @process_information = ProcessInformation.create(create_params)
        @test_algorithm = TestAlgorithm.create(:param1 => @param1)
        @test_algorithm.process_information = @process_information
        @test_algorithm.save
        redirect_to process_execute_path(:workflow_id => create_params[:workflow_information_id], :active_page => "share")
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
        if params[:active_page] == "running"
            @refresh_info = receive dest_reply: "INFO"
        end
    end


    def upload
        uploaded_io = params[:upload][:file]
        filename = upload_file(uploaded_io)
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
end

