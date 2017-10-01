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
  include DashboardSettingsSection

  has_many :tour_coach_amenities, dependent: :destroy
  has_many :tour_coaches, through: :tour_coach_amenities

  validates :name, presence: true

  rails_admin do
    list do
      field :id
      field :name
      field :tour_coaches do
        eager_load true
      end
    end

    edit do
      field :name
    end
  end
end
