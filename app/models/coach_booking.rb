class CoachBooking < ApplicationRecord
  belongs_to :tour_coach
  belongs_to :tour_booking

  validates :tour_coach, :tour_booking, :seats, presence: true

  def title
    "#{tour_booking.username} -> #{tour_coach.title}"
  rescue
    'New Coach Booking'
  end
end
