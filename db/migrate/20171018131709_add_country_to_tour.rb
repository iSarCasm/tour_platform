class AddCountryToTour < ActiveRecord::Migration[5.1]
  def change
    add_reference :tours, :country, foreign_key: true
  end
end
