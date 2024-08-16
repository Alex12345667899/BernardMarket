class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true

  include PgSearch::Model
pg_search_scope :search_by_title_and_location_and_price,
  against: [ :title, :location, :price ],
  using: {
    tsearch: { prefix: true }
  }
end
