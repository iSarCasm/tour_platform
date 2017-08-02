class CreateHotelFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_facilities do |t|
      t.references :hotel, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
