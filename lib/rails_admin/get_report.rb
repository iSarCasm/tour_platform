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
            report = model_config.report.new(@object)
            render  pdf: report.name,
                    file: "#{Rails.root}/app/reports/files/#{report.name}.pdf.html",
                    locals: report.locals
          end
        end
      end
    end
  end
end
