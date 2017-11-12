class InterimReport
  def self.for(tour_hotel:)
    report = Thinreports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'files', 'interim_rooming_list.tlf')
    fill_report_header(report, tour_hotel)
    bookings = HotelBooking.joins(:hotel_room).where(hotel_rooms: {tour_hotel: tour_hotel}).order('hotel_rooms.room_type_id')
    fill_report_body(report, bookings)
    report.generate
  end

  private

  def self.fill_report_header(report, tour_hotel)
    report.on_page_create do |page|
      page.item(:title).value(tour_hotel.hotel_title)
      page.item(:subtitle).value('Including Provisional Passengers')
      page.item(:title2).value(tour_hotel.active_tour.title)
      page.item(:tour).value(tour_hotel.active_tour.tour.title)
    end
  end

  def self.fill_report_body(report, bookings)
    group_bookings(bookings).each do |group|
      add_room_type_row(report, group.first.hotel_room.room_type)
      group.each do |booking|
        report.list.add_row do |row|
          row.item(:status).value(booking.status)
          row.item(:passenger_name).value(booking.tour_booking.username)
          row.item(:booking_ref).value(booking.tour_booking.ref)
          row.item(:type).value(booking.type)
          row.item(:requests).value(booking.requests)
        end
      end
      add_room_sum_row(report, group.first.hotel_room.room_type, group.size)
    end
  end

  def self.group_bookings(bookings)
    last_room_type = nil
    grouped_bookings = []
    bookings.each do |b|
      if last_room_type != b.hotel_room.room_type
        grouped_bookings << []
      end
      grouped_bookings.last << b
    end
    grouped_bookings
  end

  def self.add_room_type_row(report, room_type)
    report.list.add_row do |row|
      row.item(:room_group).value(room_type.title)
    end
  end

  def self.add_room_sum_row(report, room_type, sum)
    report.list.add_row do |row|
      row.item(:room_total).value(room_type.title + ' Total Rooms: ' + sum.to_s)
    end
  end
end
