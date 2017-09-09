class CreateAdminAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_alerts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end
