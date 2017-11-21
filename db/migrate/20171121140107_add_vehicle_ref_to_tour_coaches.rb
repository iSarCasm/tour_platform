class AddVehicleRefToTourCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_coaches, :vehicle_reg, :string
  end
end
