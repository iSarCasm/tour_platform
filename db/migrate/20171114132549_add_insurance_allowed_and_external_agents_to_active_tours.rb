class AddInsuranceAllowedAndExternalAgentsToActiveTours < ActiveRecord::Migration[5.1]
  def change
    add_column :active_tours, :allow_external_agents, :boolean
    add_column :active_tours, :insurance_allowed, :boolean
  end
end
