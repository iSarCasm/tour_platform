class AddAmentitiesToFerryDates < ActiveRecord::Migration[5.1]
  def change
    create_table :ferry_dates_amenities do |t|
      t.references :ferry_date, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
