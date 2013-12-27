class OffersController < ApplicationController
  before_action :authenticate!, except: :index

  def index
  end

  def new
  end
end
