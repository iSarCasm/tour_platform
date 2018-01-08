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
            report_class = params[:report].constantize
            report = report_class.new(@object)
            if report.inline?
              render  pdf: report.name,
                      file: "#{Rails.root}/app/reports/views/#{report.filename}",
                      locals: report.locals
            else
              send_data report.data, filename: report.filename
            end
          end
        end
      end
    end
  end
end
