class ChangeSubjectClassType < ActiveRecord::Migration[5.1]
  def change
    remove_column :permissions, :subject_class
    add_column :permissions, :subject_class, :integer
  end
end
