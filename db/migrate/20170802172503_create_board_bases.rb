class CreateBoardBases < ActiveRecord::Migration[5.1]
  def change
    create_table :board_bases do |t|
      t.string :title

      t.timestamps
    end
  end
end
