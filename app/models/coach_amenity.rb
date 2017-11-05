# == Schema Information
#
# Table name: coach_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoachAmenity < ApplicationRecord
  has_many :coach_coach_amenities, dependent: :destroy
  has_many :tour_coach_amenities, dependent: :destroy
  has_many :tour_coaches, through: :tour_coach_amenities
  has_many :coaches, through: :coach_coach_amenities

  validates :name, presence: true
end
