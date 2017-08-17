class AddSeatplanToTourCoaches < ActiveRecord::Migration[5.1]
  def change
    remove_column :tour_coaches, :seats
    add_reference :tour_coaches, :seatplan, foreign_key: true
  end
end
