class OffersController < ApplicationController
  def new
    @offer = Offer.New
  end

  def create
    @offer = Offer.New(offer_params)
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
