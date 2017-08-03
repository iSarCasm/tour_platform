class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission

  rails_admin do
    hide
  end
end
