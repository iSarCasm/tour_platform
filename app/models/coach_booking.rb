class CoachBooking < ApplicationRecord
  belongs_to :coach
  belongs_to :tour_booking
end
