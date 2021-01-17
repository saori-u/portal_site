class PortalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @portals = Portal.all
    @portals = Portal.includes(:user).order("created_at DESC")
  end

  def new
    @portal = Portal.new
  end

  def create
    @portal = Portal.new(portal_params)
    if @portal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @portal = Portal.find(params[:id])
    @comment   = Comment.new
    @comments  = @portal.comments.includes(:user)
  end

  def edit
    @portal = Portal.find(params[:id])
    unless @portal.user_id == current_user.id
      redirect_to root_path
    end 
  end

  def update
    @portal = Portal.find(params[:id])
    if @portal.update(portal_params)
      redirect_to  portal_path
    else
      render :edit
    end
  end

  def destroy
    @portal = Portal.find(params[:id])
    if @portal.destroy
     redirect_to root_path
    end
  end

  private
  def portal_params
    params.require(:portal).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end