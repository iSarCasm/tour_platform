class CoachBooking < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :coach_bookings
  belongs_to :tour_booking, inverse_of: :coach_bookings

  validates :tour_coach, :tour_booking, :seats, presence: true

  rails_admin do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  def title
    "#{tour_booking.username} -> #{tour_coach.title}"
  rescue
    'New Coach Booking'
  end
end
