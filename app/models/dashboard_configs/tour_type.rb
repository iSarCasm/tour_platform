# == Schema Information
#
# Table name: tour_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model TourType do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :name
      field :tours
    end

    edit do
      field :name
    end
  end
end
