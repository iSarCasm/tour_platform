class AddMoreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :notes, :text
    add_column :users, :may_expand_more_with_full_contact, :boolean
    add_column :users, :client_unsuitable_for_travel, :boolean
  end
end
