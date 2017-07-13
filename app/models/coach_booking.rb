class CoachBooking < ApplicationRecord
  belongs_to :coach
  belongs_to :tour_booking

  validates :coach, :tour_booking, :seats, presence: true
end
