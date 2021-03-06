# == Schema Information
#
# Table name: tour_amenities
#
#  id            :integer          not null, primary key
#  tour_coach_id :integer
#  amenity_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TourAmenity < ApplicationRecord
  belongs_to :tour_coach
  belongs_to :amenity
end
