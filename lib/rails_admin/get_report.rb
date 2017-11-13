module RailsAdmin
  module Config
    module Actions
      class GetReport < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          false
        end

        register_instance_option :member do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
            send_data InterimReport.new(tour_hotel: @object).generate,
              filename: 'report.pdf',
              type: 'application/pdf',
              disposition: 'inline'
          end
        end
      end
    end
  end
end
