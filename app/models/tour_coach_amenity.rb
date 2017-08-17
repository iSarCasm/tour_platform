class TourCoachAmenity < ApplicationRecord
  belongs_to :tour_coach
  belongs_to :coach_amenity

  rails_admin do
    hide
  end
end
