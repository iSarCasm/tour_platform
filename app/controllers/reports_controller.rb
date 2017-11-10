class ReportsController < ApplicationController
  def interim_report
    @tour_hotel = TourHotel.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        send_data generate_interim_report(tour_hotel: @tour_hotel),
          filename: 'report.pdf',
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  private

  def generate_interim_report(tour_hotel:)
    report = Thinreports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'interim_rooming_list.tlf')

    report.on_page_create do |page|
      page.item(:title).value(tour_hotel.hotel_title)
      page.item(:subtitle).value('Including Provisional Passengers')
      page.item(:title2).value(tour_hotel.active_tour.title)
      page.item(:tour).value(tour_hotel.active_tour.tour.title)
    end

    40.times do |i|
      report.list.add_row do |row|
        if i % 8 == 0
          row.item(:room_group).value('Room : DOUBLE')
        elsif i % 8 == 7
          row.item(:room_total).value('DOUBLE Total Rooms: ' + i.to_s)
        else
          row.item(:status).value('status' + i.to_s)
          row.item(:passenger_name).value('passenger_name' + i.to_s)
          row.item(:booking_ref).value('booking_ref' + i.to_s)
          row.item(:type).value('type' + i.to_s)
          row.item(:requests).value('requests' + i.to_s)
        end
      end
    end

    report.generate
  end
end
