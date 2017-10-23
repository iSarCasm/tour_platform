class RenameDefaultColumntsForTour < ActiveRecord::Migration[5.1]
  def change
    rename_column :tours, :default_other_costs, :other_costs
    rename_column :tours, :default_self_drive, :self_drive
    rename_column :tours, :default_allow_deposits, :allow_deposits
  end
end
