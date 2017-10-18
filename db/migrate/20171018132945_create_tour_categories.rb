class CreateTourCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_categories do |t|
      t.references :tour, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
