class CreatePickupPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :pickup_points do |t|
      t.references :pickup_list, foreign_key: true
      t.string :address
      t.decimal :longtitude
      t.decimal :latitude
      t.string :time_to_hub
      t.string :time_from_hub

      t.timestamps
    end
  end
end
