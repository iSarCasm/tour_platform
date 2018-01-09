class CreateHotelOptionHotelBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_option_hotel_bookings do |t|
      t.references :hotel_booking, foreign_key: true
      t.references :hotel_option, foreign_key: true

      t.timestamps
    end
  end
end
