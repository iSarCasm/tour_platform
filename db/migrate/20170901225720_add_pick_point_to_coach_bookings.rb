class AddPickPointToCoachBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :coach_bookings, :pickup_point, foreign_key: true
  end
end
