class AddFieldsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :address, :string
    add_column :hotels, :phone_number, :string
    add_column :hotels, :fax_number, :string
    add_column :hotels, :email, :string
    add_column :hotels, :website, :string
    add_column :hotels, :contact_name, :string
    add_column :hotels, :emergency_number, :string
    add_column :hotels, :rating, :decimal
  end
end
