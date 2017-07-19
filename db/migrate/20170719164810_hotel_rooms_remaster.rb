class HotelRoomsRemaster < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotel_rooms, :number
    add_column :hotel_rooms, :amount, :integer
  end
end
