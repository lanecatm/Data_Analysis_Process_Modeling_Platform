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
        debugger
        case recv['status']
        when 'ok'
            #c.status = recv[c.id.to_s]['status'] if c.status != :finished
            @process_id = recv["process_id"]
        else # error
            @err_msg = recv['error']
        end
        redirect_to process_execute_path
        # 发一个请求
        # 先收到一个process_id
        # send_receive
    end

    def show_execute
        @workflow_information = WorkflowInformation.last
        @refresh_info = params[:msg_info]
    end
    def refresh_info
        msg_info = receive dest_reply: "INFO"
        redirect_to process_execute_path(:msg_info=>msg_info)
    end

    def refresh
      clt = SimpleStomp::Client.new
      clt.subscribe "run_case.reply"
      msg = clt.receive
      clt.ack msg
      msg
    end
end
