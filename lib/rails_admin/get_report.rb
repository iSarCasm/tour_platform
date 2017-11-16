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
            # send_data InterimReport.new(tour_hotel: @object).generate,
            #   filename: 'report.pdf',
            #   type: 'application/pdf',
            #   disposition: 'inline'
            render  pdf: 'interim_rooming_list',
                    file: "#{Rails.root}/app/reports/files/interim_rooming_list.pdf.html",
                    locals: InterimReportView.for(tour_hotel: @object)
          end
        end
      end
    end
  end
end
