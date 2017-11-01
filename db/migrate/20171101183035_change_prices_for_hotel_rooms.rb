class ChangePricesForHotelRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotel_rooms, :infant_supp
    remove_column :hotel_rooms, :child_supp

    rename_column :hotel_rooms, :adult, :adult_buy
    rename_column :hotel_rooms, :senior, :senior_buy
    rename_column :hotel_rooms, :child, :child_buy
    rename_column :hotel_rooms, :infant, :infant_buy

    add_column :hotel_rooms, :adult_sell, :decimal, default: 0
    add_column :hotel_rooms, :senior_sell, :decimal, default: 0
    add_column :hotel_rooms, :child_sell, :decimal, default: 0
    add_column :hotel_rooms, :infant_sell, :decimal, default: 0
  end
end
