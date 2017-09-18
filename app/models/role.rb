# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :users, inverse_of: :role

  validates :name, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :name
      field :description
      field :permissions
      field :users
    end

    edit do
      exclude_fields :role_permissions
    end
  end
end
