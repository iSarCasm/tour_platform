class CreateSeatPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :seat_prices do |t|
      t.string :char
      t.decimal :price
      t.references :tour_coach, foreign_key: true

      t.timestamps
    end
  end
end
