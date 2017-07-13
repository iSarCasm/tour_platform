class TourBooking < ApplicationRecord
  has_many :hotel_bookings
  has_one :coach_booking
  belongs_to :active_tour
  belongs_to :user

  validates :active_tour, :user, presence: true
end
