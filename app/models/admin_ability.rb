class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      admin_ability
      role_ability(user)
    end
    # can :manage, :all
  end

  private

  def admin_ability
    can :access, :rails_admin
    can :dashboard
    can :dashboard, :all # wtf
  end

  def role_ability(user)
    if user.role
      user.role.permissions.each do |permission|
        if permission.subject_id.nil?
          can permission.action_symbol, permission.subject_class.constantize
        else
          can permission.action_symbol, permission.subject_class.constantize, :id => permission.subject_id
        end
      end
    end
  end
end
