class RemoveExcursionsFromTours < ActiveRecord::Migration[5.1]
  def change
    remove_column :tours, :excursions
  end
end
