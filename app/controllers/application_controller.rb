class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin
  	unless current_user
  		redirect_to signin_path
  	end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def require_admin
    unless current_user_admin?
      redirect_to signin_path, alert: "You are not authorized to access that page!"
    end
  end

end
