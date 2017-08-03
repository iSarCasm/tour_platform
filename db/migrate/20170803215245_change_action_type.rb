class ChangeActionType < ActiveRecord::Migration[5.1]
  def change
    remove_column :permissions, :action
    add_column :permissions, :action, :integer
  end
end
