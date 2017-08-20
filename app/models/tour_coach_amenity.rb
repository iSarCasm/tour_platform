# == Schema Information
#
# Table name: tour_coach_amenities
#
#  id               :integer          not null, primary key
#  tour_coach_id    :integer
#  coach_amenity_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TourCoachAmenity < ApplicationRecord
  belongs_to :tour_coach
  belongs_to :coach_amenity

  rails_admin do
    hide
  end
end
