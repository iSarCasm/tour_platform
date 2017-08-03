class RemoveMetaFromPermissions < ActiveRecord::Migration[5.1]
  def change
    remove_column :permissions, :name
    remove_column :permissions, :description
  end
end
