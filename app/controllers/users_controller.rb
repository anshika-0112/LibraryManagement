class UsersController < ApplicationController
  before_action :set_user, only:[:show,:destroy]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

end
