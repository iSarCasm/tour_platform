class RenameCoachAmenitiesToAmenities < ActiveRecord::Migration[5.1]
  def change
    rename_table :coach_amenities, :amenities
  end
end
