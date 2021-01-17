class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @portals = @user.portals
  end
end
