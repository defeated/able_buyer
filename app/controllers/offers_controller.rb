class OffersController < ApplicationController
  respond_to :html

  before_action :authenticate!, except: [ :index ]

  def index
    skope = logged_in? ? House.includes(offers: :user) : House.all
    @houses = skope.where.not(offers_count: 0).order(updated_at: :desc)
  end

  def new
    @offer = current_user.offers.build
    @house = @offer.build_house
  end

  def create
    @house = House.create house_params
    @offer = current_user.offers.build offer_params
    @offer.house = @house
    @offer.save
    respond_with @offer
  end

  private

    def house_params
      params.require(:house).permit(:address)
    end

    def offer_params
      params.require(:offer).permit(:amount, :offered_at, :replied_at, :reason)
    end
end
