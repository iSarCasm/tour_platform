class CreateTourCoachAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_coach_amenities do |t|
      t.references :tour_coach, foreign_key: true
      t.references :coach_amenity, foreign_key: true

      t.timestamps
    end
  end
end
