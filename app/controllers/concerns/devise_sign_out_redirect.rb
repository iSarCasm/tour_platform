module DeviseSignOutRedirect
  extend ActiveSupport::Concern

  included do
    def after_sign_out_path_for(resource)
      request.referrer || root_path
    end
  end
end
