class HistoryController < ApplicationController

    def show_model
        @workflow_informations = WorkflowInformation.all
    end


    def show_use_case
    end
end
