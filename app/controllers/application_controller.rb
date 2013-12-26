class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate!
    return if current_user
    redirect_to '/auth/facebook'
  end

  def current_user
    @current_user ||= if id = session[:user_id] then
      User.find_by id
    end
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.to_param
  end
end
