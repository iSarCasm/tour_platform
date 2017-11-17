class AddManyNewFieldsToFerries < ActiveRecord::Migration[5.1]
  def change
    add_column :ferries, :address, :string
    add_column :ferries, :website, :string
    add_column :ferries, :phone_number, :string
    add_column :ferries, :contact_name, :string
    add_column :ferries, :fax_number, :string
    add_column :ferries, :emergency_number, :string
    add_column :ferries, :email, :string
    add_column :ferries, :rating, :decimal
    add_column :ferries, :notes, :text
  end
end
