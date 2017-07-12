class CreateHotelBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_bookings do |t|
      t.references :hotel_room, foreign_key: true
      t.references :tour_booking, foreign_key: true

      t.timestamps
    end
  end
end
