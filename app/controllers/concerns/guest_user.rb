module GuestUser
  extend ActiveSupport::Concern

  included do
    def current_user
      super || Guest.new
    end

    def user_signed_in?
      !current_user.kind_of? Guest
    end
  end
end
