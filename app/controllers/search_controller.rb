class SearchController < ApplicationController
    def search
        @workflow_informations = WorkflowInformation.all
        redirect_to search_path(search_params)
    end

    def show
        @active_page = "all"
        @all_workflow_informations = WorkflowInformation.all.group(:name)
        @tag_workflow_informations = WorkflowInformation.all
        @title_workflow_informations = WorkflowInformation.all
        @other_workflow_informations = WorkflowInformation.all
        case params[:search_for]
        when "model"
            if params[:search_content] == nil or params[:search_content] == ""
                @all_workflow_informations = WorkflowInformation.all.group(:name)
                @tag_workflow_informations = WorkflowInformation.all.group(:name)
                @title_workflow_informations = WorkflowInformation.all.group(:name)
                @other_workflow_informations = WorkflowInformation.all.group(:name)
                @all_workflow_informations_without_group = WorkflowInformation.all
                @tag_workflow_informations_without_group = WorkflowInformation.all
                @title_workflow_informations_without_group = WorkflowInformation.all
                @other_workflow_informations_without_group = WorkflowInformation.all
                @workflow_information_by_categories = WorkflowInformation.group(:name, :category_id).count

            else
                search_content_str = "%" + params[:search_content] + "%"
                @tag_ids = WorkflowTag.select("id").where("name like ?", search_content_str)
                @workflow_information_ids = WorkflowInformationAndTag.select("workflow_information_id").where("workflow_tag_id in (?)", @tag_ids)
                @tag_workflow_informations = WorkflowInformation.where("id in (?)", @workflow_information_ids).group(:name)
                @all_workflow_informations = WorkflowInformation.where("name like ? or introduction like ? or detial_description like ? or id in(?)", search_content_str, search_content_str, search_content_str, @workflow_information_ids).group(:name)
                @title_workflow_informations = WorkflowInformation.where("name like ?", search_content_str).group(:name)
                @other_workflow_informations = WorkflowInformation.where("introduction like ? or detial_description like ?", search_content_str, search_content_str).group(:name)
                @tag_workflow_informations_without_group = WorkflowInformation.where("id in (?)", @workflow_information_ids)
                @all_workflow_informations_without_group = WorkflowInformation.where("name like ? or introduction like ? or detial_description like ? or id in(?)", search_content_str, search_content_str, search_content_str, @workflow_information_ids)
                @title_workflow_informations_without_group = WorkflowInformation.where("name like ?", search_content_str)
                @other_workflow_informations_without_group = WorkflowInformation.where("introduction like ? or detial_description like ?", search_content_str, search_content_str)
                @workflow_information_by_categories = @all_workflow_informations.group(:category_id).count
            end
        when "use_case"
            search_content_str = "%" + params[:search_content] + "%"
            @all_process_informations = ProcessInformation.where("name like ?", search_content_str)
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
