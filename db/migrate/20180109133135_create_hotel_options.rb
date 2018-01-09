class CreateHotelOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_options do |t|
      t.string :title

      t.timestamps
    end
  end
end
