class AddHotelToHotelRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :hotel_rooms, :hotel, foreign_key: true
  end
end
