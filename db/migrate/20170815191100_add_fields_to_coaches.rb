class AddFieldsToCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :coaches, :address, :text
    add_column :coaches, :phone, :string
    add_column :coaches, :fax, :string
    add_column :coaches, :website, :text
    add_column :coaches, :email, :string
    add_column :coaches, :contact_name, :string
    add_column :coaches, :mobile_number, :string
  end
end
