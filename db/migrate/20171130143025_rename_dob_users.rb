class RenameDobUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :passport_date_of_birth, :date_of_birth
  end
end
