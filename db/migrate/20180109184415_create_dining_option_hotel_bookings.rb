class CreateDiningOptionHotelBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :dining_option_hotel_bookings do |t|
      t.references :hotel_booking, foreign_key: true
      t.references :dining_option, foreign_key: true

      t.timestamps
    end
  end
end
