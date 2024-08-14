class BookingsController < ApplicationController
  before_action :set_offer, only: %i[create]

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

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(accepted: params[:accepted])
      if @booking.accepted
        flash[:success] = '😁 You have accepted this booking !'
      else
        flash[:alert] = '😔 You have declined this booking ...'
      end
    else
      flash[:alert] = '😔 Something went wrong'
    end
    redirect_to dashboards_bookings_path
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
