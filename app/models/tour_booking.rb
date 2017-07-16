class TourBooking < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :tour_booking
  has_many :coach_bookings, dependent: :destroy, inverse_of: :tour_booking
  belongs_to :active_tour, inverse_of: :tour_bookings
  belongs_to :user, inverse_of: :tour_bookings

  accepts_nested_attributes_for :hotel_bookings, allow_destroy: true
  accepts_nested_attributes_for :coach_bookings, allow_destroy: true

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
