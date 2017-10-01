module DashboardSettingsSection
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Settings'
      weight 999
    end
  end
end
