class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
