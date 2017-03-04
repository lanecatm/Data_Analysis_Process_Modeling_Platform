class CommentsController < ApplicationController
    def create
        @process_information = ProcessInformation.find(params[:process_information_id])
        @comment = @process_information.comments.create(comment_params)
        redirect_to process_information_path(@process_information)
    end
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :score)
    end
end
