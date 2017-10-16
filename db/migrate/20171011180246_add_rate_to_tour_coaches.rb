class AddRateToTourCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_coaches, :rate, :decimal
  end
end
