class CreateExcursionTours < ActiveRecord::Migration[5.1]
  def change
    create_table :excursion_tours do |t|
      t.references :excursion, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
