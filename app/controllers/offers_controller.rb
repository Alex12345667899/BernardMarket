class OffersController < ApplicationController
  def index
    @offers = Offer.all
    if params[:search] && params[:search][:query].present?
      @offers = Offer.search_by_title_and_location_and_price(params[:search][:query])
    else
      
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :location, :price)
  end
end
