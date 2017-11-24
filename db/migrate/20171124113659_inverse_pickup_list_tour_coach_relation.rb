class InversePickupListTourCoachRelation < ActiveRecord::Migration[5.1]
  def change
    remove_column :pickup_lists, :tour_coach_id
    add_column :tour_coaches, :pickup_list_id, :bigint, foreign_key: true
    add_index :tour_coaches, :pickup_list_id
  end
end
