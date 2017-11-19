# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Amenity < ApplicationRecord
  has_many :coach_amenities, dependent: :destroy
  has_many :tour_amenities, dependent: :destroy
  has_many :tour_coaches, through: :tour_amenities
  has_many :coaches, through: :coach_amenities

  validates :name, presence: true
end
