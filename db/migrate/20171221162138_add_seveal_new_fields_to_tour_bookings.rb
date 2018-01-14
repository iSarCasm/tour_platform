class AddSevealNewFieldsToTourBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_bookings, :agent_commission, :decimal, default: 0
    add_column :tour_bookings, :cost_commission, :decimal, default: 0
    add_column :tour_bookings, :vat_rate, :decimal, default: 0
    add_column :tour_bookings, :deposit, :decimal, default: 0
    add_column :tour_bookings, :paid, :decimal, default: 0
    add_column :tour_bookings, :agent_paid, :boolean, default: false
  end
end
