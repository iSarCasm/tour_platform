class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types do |t|
      t.string :room_type
      t.integer :pax

      t.timestamps
    end
  end
end
