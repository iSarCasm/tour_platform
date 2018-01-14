class CreateCoachOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_options do |t|
      t.string :title

      t.timestamps
    end
  end
end
