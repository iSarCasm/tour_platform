class AddExcursionReferenceToTourExcursions < ActiveRecord::Migration[5.1]
  def change
    add_reference :tour_excursions, :excursion, foreign_key: true
  end
end
