class HistoryController < ApplicationController

    def show_model
        @workflow_informations = WorkflowInformation.all
    end


    def show_use_case
        @process_informations = ProcessInformation.where(:is_shared => true).all
    end

    def show_running_record
        @process_informations = ProcessInformation.all
    end
end
