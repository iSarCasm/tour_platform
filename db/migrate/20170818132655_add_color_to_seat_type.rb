class AddColorToSeatType < ActiveRecord::Migration[5.1]
  def change
    add_column :seat_types, :color, :string
  end
end
