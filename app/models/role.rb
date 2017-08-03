class Role < ApplicationRecord
  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :users, inverse_of: :role

  validates :name, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :role_permissions, :created_at, :updated_at, :id
    end
    edit do
      exclude_fields :role_permissions
    end
  end
end
