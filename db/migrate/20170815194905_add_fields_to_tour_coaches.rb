class AddFieldsToTourCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_coaches, :driver_name, :string
    add_column :tour_coaches, :driver_number, :string
    add_column :tour_coaches, :notes, :text
  end
end
