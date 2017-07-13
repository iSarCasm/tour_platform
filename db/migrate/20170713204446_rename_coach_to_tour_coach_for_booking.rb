class RenameCoachToTourCoachForBooking < ActiveRecord::Migration[5.1]
  def change
    rename_column :coach_bookings, :coach_id, :tour_coach_id
  end
end
