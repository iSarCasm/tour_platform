class CreateHotelRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_rooms do |t|
      t.references :hotel, foreign_key: true
      t.integer :type
      t.integer :number
      t.integer :places

      t.timestamps
    end
  end
end
