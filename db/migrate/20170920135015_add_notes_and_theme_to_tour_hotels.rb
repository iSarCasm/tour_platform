class AddNotesAndThemeToTourHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_hotels, :hotel_theme, :string
    add_column :tour_hotels, :notes, :text
  end
end
