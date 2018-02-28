class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.integer :type
      t.string :title
      t.string :initials
      t.string :phone
      t.references :pickup_point, foreign_key: true

      t.timestamps
    end
  end
end
