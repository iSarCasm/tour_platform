class ChangeHotelTourHotelForRooms < ActiveRecord::Migration[5.1]
  def change
    rename_column :hotel_rooms, :hotel_id, :tour_hotel_id
  end
end
