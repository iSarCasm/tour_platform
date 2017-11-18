class AddFieldsToTicketOperators < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_operators, :address, :text
    add_column :ticket_operators, :description, :text
    add_column :ticket_operators, :website, :string
    add_column :ticket_operators, :phone_number, :string
    add_column :ticket_operators, :buyer_name, :string
    add_column :ticket_operators, :fax_number, :string
    add_column :ticket_operators, :buyer_number, :string
    add_column :ticket_operators, :email, :string
    add_column :ticket_operators, :rating, :decimal
  end
end
