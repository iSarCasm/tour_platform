class ChangeRoomTypeOfHotelRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotel_rooms, :room_type
    add_reference :hotel_rooms, :room_type, index: true
  end
end
