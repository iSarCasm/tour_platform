# == Schema Information
#
# Table name: seat_types
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  char       :string
#  is_seat    :boolean
#  color      :string
#

RailsAdmin.config do |config|
  config.model SeatType do
    navigation_label 'Settings'
    weight 999

    edit do
      field :name
      field :price
      field :char
      field :is_seat
      field :color, :color
    end

    list do
      field :char
      field :name
      field :is_seat
      field :color
      field :price
    end
  end
end
