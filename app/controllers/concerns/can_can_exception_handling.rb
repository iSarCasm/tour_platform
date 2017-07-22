module CanCanExceptionHandling
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to main_app.root_path, :alert => exception.message
    end
  end
end
