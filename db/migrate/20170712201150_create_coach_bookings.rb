class CreateCoachBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_bookings do |t|
      t.references :coach, foreign_key: true
      t.references :tour_booking, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end
