# == Schema Information
#
# Table name: coach_amenities
#
#  id         :integer          not null, primary key
#  coach_id   :integer
#  amenity_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoachAmenity < ApplicationRecord
  belongs_to :coach
  belongs_to :amenity
end
