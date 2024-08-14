class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to dashboards_bookings_path(@booking), notice: "Your booking request is successfully created ! Time to wait for the confirmation !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(accepted: params[:accepted])
      flash[:success] = '😁 You have accepted this booking !'
      redirect_to dashboards_bookings_path
    else
      flash[:alert] = '😔 You have declined this booking ...'
      redirect_to dashboards_bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
