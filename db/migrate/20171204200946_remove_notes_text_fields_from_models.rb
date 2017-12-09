class RemoveNotesTextFieldsFromModels < ActiveRecord::Migration[5.1]
  def change
    remove_column :coaches, :notes, :text
    remove_column :ferries, :notes, :text
    remove_column :ferry_dates, :notes, :text
    remove_column :tour_coaches, :notes, :text
    remove_column :tour_excursions, :notes, :text
    remove_column :tour_hotels, :notes, :text
  end
end
