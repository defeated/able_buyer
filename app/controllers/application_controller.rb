class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate!
    return if current_user
    redirect_to '/auth/facebook'
  end

  def current_user
    @current_user ||= if id = session[:user]
      User.find_by id: id
    end
  end

  def current_user=(user)
    @current_user = user
    session[:user] = user.to_param
  end

  def logged_in?
    current_user != nil
  end

  helper_method :current_user
  helper_method :logged_in?
end
