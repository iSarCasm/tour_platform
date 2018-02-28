class AddHotelBookingIdToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_reference :passengers, :hotel_booking, foreign_key: true
  end
end