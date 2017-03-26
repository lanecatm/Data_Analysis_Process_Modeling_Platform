class WorkflowCommentsController < ApplicationController
    def create
        @workflow_information = WorkflowInformation.find(params[:workflow_information_id])
        @comment = @workflow_information.workflow_comments.create(comment_params)
        redirect_to workflow_information_path(@workflow_information)
    end
    private
    def comment_params
        params.require(:workflow_comment).permit(:title, :body, :score, :author_id, :comment_parent_id, :workflow_information_id, :process_id)
    end

end
