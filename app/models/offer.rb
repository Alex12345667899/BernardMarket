class Offer < ApplicationRecord
  belongs_to :user

  def show
    @offer = Offer.find(params[:id])
  end
end
