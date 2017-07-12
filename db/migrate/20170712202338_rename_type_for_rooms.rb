class RenameTypeForRooms < ActiveRecord::Migration[5.1]
  def change
    rename_column :hotel_rooms, :type, :room_type
  end
end
