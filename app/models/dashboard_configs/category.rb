# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model Category do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :name
    end

    edit do
      field :name
    end
  end
end
