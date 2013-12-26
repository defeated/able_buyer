class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = User.from_omniauth auth_params
    self.current_user = @user
    redirect_to root_path, notice: 'Successfully logged in!'
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'You have logged out.'
  end

  private
    def auth_params
      env['omniauth.auth']
    end
end
