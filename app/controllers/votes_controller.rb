class VotesController < ApplicationController
  before_filter :set_snippet

  def create
    if params[:type] == 'upvote'
      current_user.upvote! @snippet
      status = current_user.upvoted?(@snippet) ? 'upvoted' : 'reset'
      render json: { score: @snippet.score, status: status }
    elsif params[:type] == 'downvote'
      current_user.downvote! @snippet
      status = current_user.downvoted?(@snippet) ? 'downvoted' : 'reset'
      render json: { score: @snippet.score, status: status }
    end
  end

  private

    def set_snippet
      @snippet = Snippet.find params[:snippet_id]
    end
end
