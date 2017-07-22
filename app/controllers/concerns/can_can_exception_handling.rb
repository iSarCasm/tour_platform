module CanCanExceptionHandling
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      if current_user
        redirect_to main_app.root_path, :alert => exception.message
      else
        redirect_to new_user_session_path, :alert => exception.message
      end
    end
  end
end
