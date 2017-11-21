class AddTicketsPricesToTicketOperators < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_operators, :stock, :integer
    add_column :ticket_operators, :adult_buy, :decimal
    add_column :ticket_operators, :adult_sell, :decimal
    add_column :ticket_operators, :senior_buy, :decimal
    add_column :ticket_operators, :senior_sell, :decimal
    add_column :ticket_operators, :child_buy, :decimal
    add_column :ticket_operators, :child_sell, :decimal
    add_column :ticket_operators, :infant_buy, :decimal
    add_column :ticket_operators, :infant_sell, :decimal
  end
end
