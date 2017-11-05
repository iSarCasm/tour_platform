class AddRatingToCoaches < ActiveRecord::Migration[5.1]
  def change
    add_column :coaches, :rating, :decimal
  end
end
