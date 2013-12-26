class SessionsController < ApplicationController
  def create
    @user = User.for_omniauth auth_params
    self.current_user = @user
    redirect_to root_path, notice: 'Successfully logged in!'
  end

  private
    def auth_params
      env['omniauth.auth']
    end
end
