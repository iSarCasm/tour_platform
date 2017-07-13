class FixForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :hotel_rooms, column: :tour_hotel_id
    remove_foreign_key :coach_bookings, column: :tour_coach_id
    add_foreign_key :hotel_rooms, :tour_hotels
    add_foreign_key :coach_bookings, :tour_coaches
  end
end
