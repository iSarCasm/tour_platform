# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model Country do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :name
    end
  end
end
