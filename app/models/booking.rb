class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  before_save :total_price

  private

  def set_total_price
    journey = (end_date - start_date).to_i
    full_price = journey * self.offer.price
    self.total_price = full_price
  end
end
