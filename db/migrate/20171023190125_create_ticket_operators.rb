class CreateTicketOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_operators do |t|
      t.string :title

      t.timestamps
    end
  end
end
