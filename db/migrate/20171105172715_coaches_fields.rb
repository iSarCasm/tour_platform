class CoachesFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :coaches, :phone, :phone_number
    rename_column :coaches, :fax, :fax_number
    rename_column :coaches, :mobile_number, :emergency_number
  end
end
