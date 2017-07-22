class AddSlugToActiveTours < ActiveRecord::Migration[5.1]
  def change
    add_column :active_tours, :slug, :string
    add_index :active_tours, :slug, unique: true

    ActiveTour.find_each { |a| a.save! }
  end
end
