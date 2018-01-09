class CreateCoachOptionCoachBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_option_coach_bookings do |t|
      t.references :coach_booking, foreign_key: true
      t.references :coach_option, foreign_key: true

      t.timestamps
    end
  end
end
