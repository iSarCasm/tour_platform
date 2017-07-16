class TourBooking < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :tour_booking
  has_one :coach_booking, dependent: :destroy, inverse_of: :tour_booking
  belongs_to :active_tour, inverse_of: :tour_bookings
  belongs_to :user, inverse_of: :tour_bookings

  validates :active_tour, :user, presence: true

  def title
    "#{user.name} -> #{active_tour.title}"
  rescue
    'New Tour Booking'
  end

  def username
    user.name
  end
end
