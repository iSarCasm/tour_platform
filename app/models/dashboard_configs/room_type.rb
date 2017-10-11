# == Schema Information
#
# Table name: room_types
#
#  id          :integer          not null, primary key
#  room_type   :string
#  pax         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

RailsAdmin.config do |config|
  config.model RoomType do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :room_type
      field :pax
      field :description
      field :hotel_rooms
    end
  end
end
