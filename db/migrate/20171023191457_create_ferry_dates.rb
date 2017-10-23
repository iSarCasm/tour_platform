class CreateFerryDates < ActiveRecord::Migration[5.1]
  def change
    create_table :ferry_dates do |t|
      t.references :ferry, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
