class Offer < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
