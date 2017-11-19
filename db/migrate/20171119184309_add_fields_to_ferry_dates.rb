class AddFieldsToFerryDates < ActiveRecord::Migration[5.1]
  def change
    add_reference :ferry_dates, :active_tour, foreign_key: true
    add_column :ferry_dates, :rate, :decimal
    add_column :ferry_dates, :max_passengers, :integer
    add_column :ferry_dates, :notes, :text
  end
end
