class Ability
  include CanCan::Ability

  def initialize(user)
    guest_ability
    customer_ability unless user.kind_of? Guest
  end

  private

  def guest_ability
    can :read, :all
  end

  def customer_ability
    can :book, ActiveTour
  end
end
