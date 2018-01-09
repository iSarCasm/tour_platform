class CreateDiningOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :dining_options do |t|
      t.string :title

      t.timestamps
    end
  end
end
