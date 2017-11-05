class CreateCoachCoachAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_coach_amenities do |t|
      t.references :coach, foreign_key: true
      t.references :coach_amenity, foreign_key: true

      t.timestamps
    end
  end
end
