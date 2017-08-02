class AddDescriptionToRoomType < ActiveRecord::Migration[5.1]
  def change
    add_column :room_types, :description, :text
  end
end
