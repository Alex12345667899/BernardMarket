class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def offers
    @my_offers = current_user.offers
  end

  def bookings
    @my_bookings = current_user.bookings
    @offers_bookings = current_user.offers_bookings
  end
end
