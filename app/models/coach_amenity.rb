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
  has_many :tour_coach_amenities, dependent: :destroy
  has_many :tour_coaches, through: :tour_coach_amenities

  validates :name, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      field :name
      field :tour_coaches
    end
    edit do
      field :name
    end
  end
end
