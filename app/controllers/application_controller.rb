class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CanCanExceptionHandling
  include DeviseParameterSanitizer
  include DeviseSignInRedirect
  include DeviseSignOutRedirect
  include GuestUser
  include RedirectBack
  include AdminCanCan
end
