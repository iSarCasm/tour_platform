class CoachBooking < ApplicationRecord
  belongs_to :tour_coach
  belongs_to :tour_booking

  validates :tour_coach, :tour_booking, :seats, presence: true
end
