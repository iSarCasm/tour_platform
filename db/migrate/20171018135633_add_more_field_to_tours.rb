class AddMoreFieldToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :excursions, :text
    add_column :tours, :itinerary, :text
    add_column :tours, :important_notes, :text
    add_column :tours, :tour_memo, :text
  end
end
