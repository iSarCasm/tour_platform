class AdminAbility
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user.admin?
      admin_ability
      role_ability
    end
  end

  private

  def admin_ability
    can :manage, AdminAlert, user_id: user.id
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
end
