class WorkflowInformationsController < ApplicationController
    WORKFLOW_INFO_INIT = 1
    WORKFLOW_INFO_PUBLISH = 2
    WORKFLOW_INFO_EDITING = 3

    def new
        
    end

    def create
        @workflow_information = WorkflowInformation.create(all_params)
        @workflow_information.save
        @workflow_privilege = WorkflowPrivilege.create
        @workflow_privilege.edit_department = DepartmentInformation.find(1)
        @workflow_privilege.execute_department = DepartmentInformation.find(1)
        @workflow_privilege.delete_department = DepartmentInformation.find(1)
        @workflow_privilege.workflow_information = @workflow_information
        @workflow_privilege.save
        #@workflow_information.save
        #redirect_to @workflow_information
        redirect_to edit_workflow_information_path(@workflow_information.id)
    end

    def edit
        @workflow_information = WorkflowInformation.find(params[:id])
        @categories = WorkflowCategory.all.collect{|t| [t.name, t.id]}
        @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}

    end

    def update
        @workflow_information = WorkflowInformation.find(params[:id])
        if @workflow_information.update(all_params)
            redirect_to edit_workflow_information_path(@workflow_information.id)
        else
            render 'edit'
        end
        #@workflow_privilege = @workflow_information.workflow_privilege
        #if @workflow_privilege.update(workflow_privilege_params[:workflow_privilege])
        #    redirect_to edit_workflow_information_path(@workflow_information.id)
        #else
        #    render 'edit'
        #end
    end

    def show
        @workflow_information = WorkflowInformation.find(params[:id])
    end

    private
    def all_params
        params.require(:workflow_information).permit(:name, :introduction, :detial_description, :version_name, :category_id, :tag, :author, :last_editor, :status, :createtime)
        #:valid_from, :valid_to, :persistent, :priority, :most_possible_duration, :minimal_duration, :maximal_duration)
    end

    def info_params
        params.require(:workflow_information).permit(:name, :introduction, :detial_description, :version_name, :category, :tag)
    end

    def workflow_privilege_params
        params.require(:workflow_information).permit(:workflow_information_id, workflow_privilege: [:edit_department_id, :execute_department_id, :delete_department_id])
    end
end
