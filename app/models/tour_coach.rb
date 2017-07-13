class TourCoach < ApplicationRecord
  has_many :coach_bookings
  belongs_to :coach
  belongs_to :active_tour

  validates :coach, :active_tour, presence: true
end
