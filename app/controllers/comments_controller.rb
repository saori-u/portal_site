class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to portal_path(@comment.portal)
    else
      @portal = @comment.portal
      @comments = @portal.comments
      render "portals/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, portal_id: params[:portal_id])
  end
end