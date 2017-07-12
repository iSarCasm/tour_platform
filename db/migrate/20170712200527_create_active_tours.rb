class CreateActiveTours < ActiveRecord::Migration[5.1]
  def change
    create_table :active_tours do |t|
      t.references :tour, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
