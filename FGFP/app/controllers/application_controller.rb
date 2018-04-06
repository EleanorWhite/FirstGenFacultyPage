class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # added from OAuth tutorial
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Note that this is a hacky way to define the admin
  def admin_id
    @admin_id = 1
  end

end
