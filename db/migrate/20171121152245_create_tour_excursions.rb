class CreateTourExcursions < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_excursions do |t|
      t.references :ticket_operator, foreign_key: true
      t.references :active_tour, foreign_key: true
      t.datetime :ticket_date
      t.text :notes
      t.integer :stock
      t.decimal :adult_buy
      t.decimal :adult_sell
      t.decimal :senior_buy
      t.decimal :senior_sell
      t.decimal :child_buy
      t.decimal :child_sell
      t.decimal :infant_buy
      t.decimal :infant_sell

      t.timestamps
    end
  end
end
