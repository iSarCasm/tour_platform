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

RailsAdmin.config do |config|
  config.model TourAmenity do
    hide
  end
end
