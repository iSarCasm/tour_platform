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

RailsAdmin.config do |config|
  config.model CoachCoachAmenity do
    hide
  end
end
