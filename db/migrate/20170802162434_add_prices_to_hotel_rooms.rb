class AddPricesToHotelRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :hotel_rooms, :adult, :decimal, default: 0
    add_column :hotel_rooms, :adult_supp, :decimal, default: 0
    add_column :hotel_rooms, :child, :decimal, default: 0
    add_column :hotel_rooms, :child_supp, :decimal, default: 0
    add_column :hotel_rooms, :infant, :decimal, default: 0
    add_column :hotel_rooms, :infant_supp, :decimal, default: 0
    add_column :hotel_rooms, :senior, :decimal, default: 0
    add_column :hotel_rooms, :senior_supp, :decimal, default: 0
  end
end
