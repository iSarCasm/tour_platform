class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :title, :string
    add_column :users, :address, :string
    add_column :users, :postcode, :string
    add_column :users, :passport_name, :string
    add_column :users, :passport_no, :string
    add_column :users, :passport_date_of_birth, :date
    add_column :users, :phone_mobile, :string
    add_column :users, :phone_landline, :string
    add_column :users, :phone_evening, :string
    add_column :users, :marketing, :boolean
    add_column :users, :kin_name, :string
    add_column :users, :kin_phone, :string
    add_column :users, :travel_club, :boolean
    add_column :users, :member_no, :string
  end
end
