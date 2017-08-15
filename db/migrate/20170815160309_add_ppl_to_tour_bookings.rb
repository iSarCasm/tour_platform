class AddPplToTourBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_bookings, :adult, :integer
    add_column :tour_bookings, :child, :integer
    add_column :tour_bookings, :infant, :integer
    add_column :tour_bookings, :senior, :integer
  end
end
