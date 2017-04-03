class HistoryController < ApplicationController

    def show_model
        @workflow_informations = WorkflowInformation.all
    end


    def show_use_case
        @process_informations = ProcessInformation.all
    end
end
