class SearchController < ApplicationController
    def search
        @workflow_informations = WorkflowInformation.all
        redirect_to search_path(search_params)
    end

    def show
        @active_page = "all"
        @none_workflow_informations = []
        @all_workflow_informations = WorkflowInformation.all
        case params[:search_for]
        when "model"
            if params[:search_content] == nil or params[:search_content] == ""
                @all_workflow_informations = WorkflowInformation.all
            else
                search_content_str = "%" + params[:search_content] + "%"
                @tag_ids = WorkflowTag.select("id").where("name like ?", search_content_str)
                @workflow_information_ids = WorkflowInformationAndTag.select("workflow_information_id").where("workflow_tag_id in (?)", @tag_ids)
                @tag_workflow_informations = WorkflowInformation.where("id in (?)", @workflow_information_ids).group(:name)
                @all_workflow_informations = WorkflowInformation.where("name like ? or introduction like ? or detial_description like ? or id in(?)", search_content_str, search_content_str, search_content_str, @workflow_information_ids).group(:name)
                @title_workflow_informations = WorkflowInformation.where("name like ?", search_content_str).group(:name)
                @other_workflow_informations = WorkflowInformation.where("introduction like ? or detial_description like ?", search_content_str, search_content_str).group(:name)
            end

            
        when "use_case"
            @all_workflow_informations = []
            @title_workflow_informations = []
            @other_workflow_informations = []
        end
        @active_choice = params[:search_for]

    end
    private
    def search_params
        params.require(:search_request).permit(:search_for, :search_content)
    end

end
