class AddCoachToSeatPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :seat_prices, :coach, foreign_key: true
  end
end
