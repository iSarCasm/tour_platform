RailsAdmin.config do |config|
  config.model RoomType do
    list do
      field :id
      field :pax
      field :description
      field :hotel_rooms
    end
  end
end
