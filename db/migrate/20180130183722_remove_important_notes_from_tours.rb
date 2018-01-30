class RemoveImportantNotesFromTours < ActiveRecord::Migration[5.1]
  def change
    remove_column :tours, :important_notes, :text
  end
end
