class CreateTourHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_hotels do |t|
      t.references :hotel, foreign_key: true
      t.references :active_tour, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
