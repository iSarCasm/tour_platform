class RemoveNotesFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :notes, :text
  end
end
