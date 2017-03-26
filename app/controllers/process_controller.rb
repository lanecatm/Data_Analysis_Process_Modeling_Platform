class ProcessController < ApplicationController
    def show_train
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    def show_execute
        @workflow_information = WorkflowInformation.find(params[:id])
    end
end
