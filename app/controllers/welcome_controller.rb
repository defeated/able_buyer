class WelcomeController < ApplicationController
  before_action :authenticate!

  def index
    render text: 'hello, world'
  end
end
