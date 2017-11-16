class InterimReport
  attr_reader :report

  def initialize(tour_hotel:)
    @report = Thinreports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'files', 'interim_rooming_list.tlf')
    fill_report_header(tour_hotel)
    bookings = HotelBooking.joins(:hotel_room).where(hotel_rooms: { tour_hotel: tour_hotel }).order('hotel_rooms.room_type_id')
    fill_report_body(bookings)
  end

  def generate
    report.generate
  end

  private

  def fill_report_header(tour_hotel)
    report.on_page_create do |page|
      page.item(:title).value(tour_hotel.hotel_title)
      page.item(:subtitle).value('Including Provisional Passengers')
      page.item(:title2).value(tour_hotel.active_tour.title)
      page.item(:tour).value(tour_hotel.active_tour.tour.title)
    end
  end

  def fill_report_body(bookings)
    grouped_bookings = group_bookings(bookings)
    if grouped_bookings.empty?
      fill_report_with_not_found(report)
    else
      fill_report_with_groups(grouped_bookings)
    end
  end

  def fill_report_with_groups(groups)
    groups.each do |group|
      add_room_type_row(group.first.hotel_room.room_type)
      group.each {|booking| add_booking_row(booking) }
      add_room_sum_row(group.first.hotel_room.room_type, group.size)
    end
  end

  def fill_report_with_not_found(report)
    report.list.add_row do |row|
      row.item(:room_total).value('No bookings found for this hotel.')
    end
  end

  def add_booking_row(booking)
    report.list.add_row do |row|
      row.item(:status).value(booking.status)
      row.item(:passenger_name).value(booking.tour_booking.username)
      row.item(:booking_ref).value(booking.tour_booking.ref)
      row.item(:type).value(booking.type)
      row.item(:requests).value(booking.requests)
    end
  end

  def group_bookings(bookings)
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

  def add_room_type_row(room_type)
    report.list.add_row do |row|
      row.item(:room_group).value(room_type.title)
    end
  end

  def add_room_sum_row(room_type, sum)
    report.list.add_row do |row|
      row.item(:room_total).value(room_type.title + ' Total Rooms: ' + sum.to_s)
    end
  end
end
