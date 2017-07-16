class TourBooking < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy
  has_one :coach_booking, dependent: :destroy
  belongs_to :active_tour
  belongs_to :user

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
