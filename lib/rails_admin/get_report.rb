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
            raise ArgumentError, 'Malicious code' unless params[:report] =~ /Report::/
            report_class = params[:report].constantize
            report = report_class.new(@object)
            if report.inline?
              render  pdf: report.name,
                      file: report.layout,
                      locals: report.locals,
                      show_as_html: params.key?('debug')
            else
              send_data report.data, filename: report.filename
            end
          end
        end
      end
    end
  end
end
