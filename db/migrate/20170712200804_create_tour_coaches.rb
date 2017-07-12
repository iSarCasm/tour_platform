class CreateTourCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_coaches do |t|
      t.references :coach, foreign_key: true
      t.references :active_tour, foreign_key: true
      t.timestamp :departure_date
      t.timestamp :arrival_date
      t.integer :seats

      t.timestamps
    end
  end
end
