class CreatePickupLists < ActiveRecord::Migration[5.1]
  def change
    create_table :pickup_lists do |t|
      t.references :tour_coach, foreign_key: true

      t.timestamps
    end
  end
end
