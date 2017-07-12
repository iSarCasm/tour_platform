class CreateTourBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_bookings do |t|
      t.references :active_tour, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
