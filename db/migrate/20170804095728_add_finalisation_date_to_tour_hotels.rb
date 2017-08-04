class AddFinalisationDateToTourHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_hotels, :finalisation_date, :datetime
  end
end
