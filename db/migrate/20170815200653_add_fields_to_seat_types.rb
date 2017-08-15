class AddFieldsToSeatTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :seat_types, :char, :string
    add_column :seat_types, :is_seat, :boolean

    add_index :seat_types, :char, unique: true
    add_index :seat_types, :name, unique: true
  end
end
