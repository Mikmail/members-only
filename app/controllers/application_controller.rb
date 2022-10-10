class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    if !logged_in?
    redirect_to login_path
  end

end
end
