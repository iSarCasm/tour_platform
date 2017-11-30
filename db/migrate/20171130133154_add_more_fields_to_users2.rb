class AddMoreFieldsToUsers2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :marketing, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :marketing_email, :boolean
    add_column :users, :marketing_sms, :boolean
    add_column :users, :marketing_phone, :boolean
    add_column :users, :marketing_postal, :boolean
    add_column :users, :passport_expiry, :date
    add_reference :users, :gender, foreign_key: true
  end
end
