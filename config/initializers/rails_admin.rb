require Rails.root.join('lib', 'rails_admin', 'get_report.rb')

RailsAdmin.config do |config|
  config.browser_validations = false
  # Horizontaly scrolling table
  config.total_columns_width = 9999999 #

  config.default_associated_collection_limit = 500

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan, AdminAbility
  config.parent_controller = 'ApplicationController'

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    defaults
    get_report
    import
  end

  config.configure_with(:import) do |config|
    config.logging = true
  end

  config.model 'ActiveTour' do
    import do
      include_all_fields
    end
  end
end
