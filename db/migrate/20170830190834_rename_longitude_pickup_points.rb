class RenameLongitudePickupPoints < ActiveRecord::Migration[5.1]
  def change
    rename_column :pickup_points, :longtitude, :longitude
  end
end
