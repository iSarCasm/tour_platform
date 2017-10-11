class AddNewFieldsToCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :coaches, :notes, :text
    add_reference :coaches, :seatplan, foreign_key: true
  end
end
