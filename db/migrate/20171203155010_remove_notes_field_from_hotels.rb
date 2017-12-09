class RemoveNotesFieldFromHotels < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :notes, :text
  end
end
