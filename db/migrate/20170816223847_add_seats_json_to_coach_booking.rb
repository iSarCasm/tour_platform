class AddSeatsJsonToCoachBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :coach_bookings, :seats
    add_column :coach_bookings, :seats, :json
  end
end
