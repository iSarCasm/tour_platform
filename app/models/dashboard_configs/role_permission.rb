# == Schema Information
#
# Table name: role_permissions
#
#  id            :integer          not null, primary key
#  role_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

RailsAdmin.config do |config|
  config.model RolePermission do
    hide
  end
end
