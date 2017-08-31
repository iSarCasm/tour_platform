class Ability
  include CanCan::Ability

  def initialize(user)
    guest_ability
    customer_ability(user) unless user.kind_of? Guest
  end

  private

  def guest_ability
    can :read, :all
  end

  def customer_ability(user)
    can :create, TourBooking, user_id: user.id
    can :create, CoachBooking, user_id: user.id
    can :create, HotelBooking, user_id: user.id

    can :read, TourBooking, user_id: user.id
    can :read, CoachBooking, user_id: user.id
    can :read, HotelBooking, user_id: user.id

    can :destroy, TourBooking, user_id: user.id
    can :destroy, CoachBooking, user_id: user.id
    can :destroy, HotelBooking, user_id: user.id
  end
end
