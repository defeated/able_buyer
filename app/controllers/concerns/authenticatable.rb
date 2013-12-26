module Authenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def authenticate!
    redirect_to login_path unless logged_in?
  end

  def current_user
    @current_user ||= if id = session[:user] then User.find_by id: id end
  end

  def current_user=(user)
    @current_user = user
    session[:user] = user.to_param
  end

  def logged_in?
    current_user != nil
  end
end
