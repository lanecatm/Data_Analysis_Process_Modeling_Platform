class ProcessController < ApplicationController
    include SimpleStomp::Helper
    include SimpleStomp
    def show_train
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    def execute
        @workflow_id = 3
        timestamp = Time.now.to_f.to_s
        cond = {timestamp: timestamp, workflow_id: @workflow_id}
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
        redirect_to process_execute_path
        # 发一个请求
        # 先收到一个process_id
        # send_receive
    end

    def show_execute
        @workflow_information = WorkflowInformation.find(params[:workflow_id])
        @active_page = "input"
        #@refresh_info = receive dest_reply: "INFO"
    end

    def refresh_info
        redirect_to process_execute_path
    end

    def upload_file(file) 
        if !file.original_filename.empty? 
            #生成一个随机的文件名 
            @filename = get_file_name(file.original_filename) 
            #向dir目录写入文件 
            File.open("#{RAILS_ROOT}/public/emag/upload/#{@filename}", "wb") do |f| 
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
end

