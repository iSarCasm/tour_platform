class CreateSeatplans < ActiveRecord::Migration[5.1]
  def change
    create_table :seatplans do |t|
      t.string :title
      t.text :description
      t.text :plan

      t.timestamps
    end
  end
end
