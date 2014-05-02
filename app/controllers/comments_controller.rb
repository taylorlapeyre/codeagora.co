class CommentsController < ApplicationController

  # Creates a new comment, only accepts json api requests.
  def create
    @comment = current_user.comments.new comment_params
    if @comment.save
      head :no_content
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :snippet_id)
  end
end
