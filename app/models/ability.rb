class Ability
  include CanCan::Ability

  def initialize(user)
    guest_ability
    unless user.kind_of? Guest
      customer_ability
      admin_ability if user.admin?
    end
  end

  private

  def guest_ability
    can :read, :all
  end

  def customer_ability
    can :book, ActiveTour
  end

  def admin_ability
    can :access, :rails_admin
    can :dashboard
    can :manage, :all
  end
end
