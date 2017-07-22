class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CanCanExceptionHandling
  include DeviseParameterSanitizer
  include DeviseSignInRedirect
  include DeviseSignOutRedirect
  include RedirectBack

  def current_user
    super || Guest.new
  end
end
