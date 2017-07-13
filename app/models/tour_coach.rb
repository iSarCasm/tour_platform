class TourCoach < ApplicationRecord
  belongs_to :coach
  belongs_to :active_tour

  validates :coach, :active_tour, presence: true
end
