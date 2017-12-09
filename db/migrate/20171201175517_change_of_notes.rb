class ChangeOfNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :name, :string
    add_column :notes, :message, :text
    add_reference :notes, :user
  end
end
