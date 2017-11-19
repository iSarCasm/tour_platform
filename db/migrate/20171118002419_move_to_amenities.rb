class MoveToAmenities < ActiveRecord::Migration[5.1]
  def change
    remove_index :coach_coach_amenities, :coach_amenity_id
    rename_column :coach_coach_amenities, :coach_amenity_id, :amenity_id
    add_index :coach_coach_amenities, :amenity_id
    rename_table :coach_coach_amenities, :coach_amenities

    remove_index :tour_coach_amenities, :coach_amenity_id
    rename_column :tour_coach_amenities, :coach_amenity_id, :amenity_id
    add_index :tour_coach_amenities, :amenity_id
    rename_table :tour_coach_amenities, :tour_amenities

    create_table :ferry_amenities do |t|
      t.references :ferry, foreign_key: true
      t.references :amenity, foreign_key: true

      t.timestamps
    end
  end
end
