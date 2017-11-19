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

RailsAdmin.config do |config|
  config.model CoachAmenity do
    hide
  end
end
