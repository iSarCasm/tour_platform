class AddNewFieldsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_reference :hotels, :board_basis, foreign_key: true
    add_column :hotels, :notes, :text
    add_reference :hotels, :payment_type, foreign_key: true
  end
end
