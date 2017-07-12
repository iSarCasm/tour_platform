class TourCoach < ApplicationRecord
  belongs_to :coach
  belongs_to :active_tour
end
