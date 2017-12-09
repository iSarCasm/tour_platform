module AdminCanCan
  extend ActiveSupport::Concern

  included do
    def authorize_admin!(*args)
      ability = AdminAbility.new current_user
      ability.authorize! *args
    end

    def can_admin?(*args)
      ability = AdminAbility.new current_user
      ability.can? *args
    end
    helper_method :can_admin?
  end
end
