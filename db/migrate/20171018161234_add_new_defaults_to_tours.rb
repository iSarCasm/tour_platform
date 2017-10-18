class AddNewDefaultsToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :default_other_costs, :decimal
    add_column :tours, :default_self_drive, :boolean
    add_column :tours, :default_allow_deposits, :boolean
    add_column :tours, :allow_external_agents, :boolean
    add_column :tours, :insurance_allowed, :boolean
  end
end
