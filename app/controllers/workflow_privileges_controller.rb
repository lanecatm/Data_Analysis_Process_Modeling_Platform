class WorkflowPrivilegesController < ApplicationController

    before_action :authenticate_user!
    def new
    end
    def create
        @workflow_information = WorkflowInformation.find(workflow_privilege_params[:workflow_information_id])
        @workflow_privilege = WorkflowPrivilege.create(workflow_privilege_params[:workflow_privilege])
        @workflow_privilege.workflow_information = WorkflowInformation.find(params[:id])
        @workflow_privilege.save
        @workflow_information.save
        redirect_to :back
    end

    def show
        @workflow_information = WorkflowInformation.find(params[:workflow_information_id])
        @workflow_privilege = @workflow_information.workflow_privilege
    end
    private
    def workflow_privilege_params
        params.require(:workflow_information).permit(:workflow_information_id, workflow_privilege: [:edit_department_id, :execute_department_id, :delete_department_id])
    end
end
