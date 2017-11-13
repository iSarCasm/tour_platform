class TourHotelController < ApplicationController
  def interim_report
    @tour_hotel = TourHotel.find(params[:id])
    authorize! :read, @tour_hotel
    respond_to do |format|
      format.html
      format.pdf do
        send_data InterimReport.for(tour_hotel: @tour_hotel),
          filename: 'report.pdf',
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end
end
