class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CanCanExceptionHandling
  include DeviseParameterSanitizer
  include DeviseSignInRedirect
  include DeviseSignOutRedirect
  include GuestUser
  include RedirectBack

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
