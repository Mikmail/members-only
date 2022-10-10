class UsersController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :require_login, only:[:new, :create]

  def show 
    @user = User.find(params[:id])
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to root_path
    else
      render :new 
    end 
  end

  def new 
    @user = User.new 
  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end

end