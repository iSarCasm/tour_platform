# == Schema Information
#
# Table name: coach_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model CoachAmenity do
    navigation_label 'Settings'
    weight 999

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
