class RemovePlacesFromHotelRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotel_rooms, :places
  end
end
