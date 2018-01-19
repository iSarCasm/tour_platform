class CreateUserActions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_actions do |t|
      t.references :user, foreign_key: true
      t.text :action
      t.integer :subjectable_id
      t.string  :subjectable_type

      t.timestamps
    end

    add_index :user_actions, [:subjectable_type, :subjectable_id]
  end
end
