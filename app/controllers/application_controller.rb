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

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
