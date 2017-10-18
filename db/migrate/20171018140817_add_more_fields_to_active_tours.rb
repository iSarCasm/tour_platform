class AddMoreFieldsToActiveTours < ActiveRecord::Migration[5.1]
  def change
    add_column :active_tours, :allow_deposits, :boolean
    add_column :active_tours, :other_costs, :decimal
    add_column :active_tours, :self_drive, :boolean
  end
end
