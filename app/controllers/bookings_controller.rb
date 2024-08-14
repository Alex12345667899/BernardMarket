class BookingsController < ApplicationController
  before_action :set_offer

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer

    if @booking.save
      redirect_to dashboards_bookings_path, notice: 'Booking was successfully created.'
    else
      render template: "offers/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
