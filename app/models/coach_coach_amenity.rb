# == Schema Information
#
# Table name: coach_coach_amenities
#
#  id               :integer          not null, primary key
#  coach_id         :integer
#  coach_amenity_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CoachCoachAmenity < ApplicationRecord
  belongs_to :coach
  belongs_to :coach_amenity
end
