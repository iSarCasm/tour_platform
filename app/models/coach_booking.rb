class CoachBooking < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :coach_bookings
  belongs_to :tour_booking, inverse_of: :coach_bookings

  validates :tour_coach, :tour_booking, :seats, presence: true

  validate :ensure_has_seats, on: :create

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

  def ensure_has_seats
    return unless seats
    if tour_coach.seats_left < seats
      errors.add :seats, 'Seats for this coach sold out!'
    end
  end
end
