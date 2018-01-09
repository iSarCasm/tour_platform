# == Schema Information
#
# Table name: hotel_options
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model HotelOption do
    navigation_label 'Settings'
    weight 999_999

    list do
      field :id
      field :title
      field :created_at
    end

    edit do
      field :title
    end
  end
end
