# == Schema Information
#
# Table name: permissions
#
#  id            :integer          not null, primary key
#  subject_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  action        :integer
#  subject_class :integer
#

class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  enum action: [:manage, :add, :read, :edit, :remove, :export]

  Rails.application.eager_load!
  ActiveRecord::Base.descendants
  ignored_models = [Guest, RolePermission, HotelFacility]
  models = ApplicationRecord.descendants
                            .reject{ |m| ignored_models.include? m }
                            .map { |m| m.to_s.to_sym }
                            .unshift(:everything)
  enum subject_class: models

  validates :action, presence: true
  validates :subject_class, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999

    list do
      field :subject_class
      field :action
      field :subject_id
      field :roles do
        eager_load true
      end
    end

    edit do
      field :subject_class
      field :action
      field :subject_id
      field :roles
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

  def subject_class_string
    return 'all' if everything?
    subject_class.to_s
  end

  def title
    "#{action} - #{subject_id ? subject_id : subject_class}"
  end
end
