class AddBoardBasisToTourHotel < ActiveRecord::Migration[5.1]
  def change
    add_reference :tour_hotels, :board_basis, foreign_key: true
  end
end
