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
  include DashboardSettingsSection

  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :users, inverse_of: :role

  validates :name, presence: true
end
