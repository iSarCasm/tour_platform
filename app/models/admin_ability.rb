class AdminAbility
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    return unless user.admin?
    admin_ability
    role_ability
    grant_access_to_presonal_alerts
  end

  private

  def admin_ability
    can :access, :rails_admin
    can :dashboard
    can :dashboard, :all # wtf
  end

  def role_ability
    if user.role
      user.role.permissions.each do |permission|
        if permission.subject_id.nil?
          if permission.subject_class_string == 'all'
            can permission.action_symbol, :all
          else
            can permission.action_symbol, permission.subject_class_string.constantize
          end
        else
          can permission.action_symbol, permission.subject_class_string.constantize, :id => permission.subject_id
        end
      end
    end
  end

  def grant_access_to_presonal_alerts
    unless can? :manage, AdminAlert
      can :manage, AdminAlert, user_id: user.id
    end
  end
end
