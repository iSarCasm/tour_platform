class AttachTourTypeToTours < ActiveRecord::Migration[5.1]
  def change
    add_reference :tours, :tour_type, foreign_key: true
  end
end
