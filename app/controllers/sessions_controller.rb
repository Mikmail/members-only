class SessionsController < ApplicationController
  include ApplicationHelper

  skip_before_action :require_login, only:[:create, :destroy]

  def create 
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else 
      render root_path
    end
  end 

  def destroy
    session.clear 
    redirect_to login_path
  end 

end
