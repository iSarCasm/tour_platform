class RenameRole < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :role, :base_role
  end
end
