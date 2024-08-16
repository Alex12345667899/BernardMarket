class OffersController < ApplicationController
  def index
    @offers = Offer.all
    if params[:search] && params[:search][:query].present?
      @offers = Offer.search_by_title_and_location_and_price(params[:search][:query])
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
    if @offer.photo.blank? && @offer.image.blank?
      default_photo_path = Rails.root.join('app', 'assets', 'images', 'bernard.png')
      @offer.photo.attach(io: File.open(default_photo_path), filename: 'bernard.png', content_type: 'image/png')
    end
    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :location, :price, :photo)
  end
end
