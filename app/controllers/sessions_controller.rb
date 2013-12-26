class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    self.current_user = User.from_omniauth auth_params
    redirect_to root_path, notice: 'Successfully logged in!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'You have logged out.'
  end

  private
    def auth_params
      ActionController::Parameters.new( env['omniauth.auth'] ).permit!
    end
end
