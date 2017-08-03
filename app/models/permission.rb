class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  enum action: [:manage, :add, :read, :edit, :remove, :export]

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      field :subject_class
      field :action
      field :subject_id
      field :roles
    end
    edit do
      exclude_fields :role_permissions
    end
  end

  def action_symbol
    # All
    return :manage if manage?
    # CRUD
    return :create if add?
    return :read if read?
    return :update if edit?
    return :destroy if remove?
    # rails admin exclusive
    return :export if export?
  end

  def title
    "#{action} - #{subject_id ? subject_id : subject_class}"
  end
end
