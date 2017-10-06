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
