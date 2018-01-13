class InterimReportView
  InterimReportBooking = Struct.new(:hotel_booking) do
    def status
      hotel_booking.status
    end

    def username
      hotel_booking.tour_booking.username
    end

    def ref
      hotel_booking.tour_booking.ref
    end

    def type
      hotel_booking.type
    end

    def requests
      requests = ''
      requests << "#{hotel_options.pluck(:title).join(', ')}." unless hotel_options.empty?
      requests << " #{dining_options.pluck(:title).join(', ')}." unless dining_options.empty?
      requests
    end

    private

    def dining_options
      hotel_booking.dining_options
    end

    def hotel_options
      hotel_booking.hotel_options
    end
  end

  class << self
    def for(tour_hotel:)
      {
        bookings_grouped_by_room_type: bookings_grouped_by_room_type(tour_hotel),
        hotel_title: hotel_title(tour_hotel),
        board_basis: tour_hotel.board_basis.title,
        departure_date: pretty_date(tour_hotel.start_date),
        arrival_date: pretty_date(tour_hotel.end_date),
        nights: tour_hotel.nights,
        tour_ref: tour_ref(tour_hotel)
      }
    end

    private

    def bookings_grouped_by_room_type(tour_hotel)
      bookings = HotelBooking.joins(:hotel_room)
                             .where(hotel_rooms: { tour_hotel: tour_hotel })
                             .order('hotel_rooms.room_type_id')
      group_bookings(bookings)
    end

    def group_bookings(bookings)
      last_room_type = nil
      bookings_grouped_by_room_type = []
      bookings.each do |b|
        if last_room_type != b.hotel_room.room_type
          last_room_type = b.hotel_room.room_type
          bookings_grouped_by_room_type << { type: b.hotel_room.room_type, bookings: [] }
        end
        bookings_grouped_by_room_type.last[:bookings] << InterimReportBooking.new(b)
      end
      bookings_grouped_by_room_type
    end

    def hotel_title(tour_hotel)
      tour_hotel.hotel_title
    end

    def tour_desc(tour_hotel)
      tour_hotel.active_tour.title
    end

    def tour_ref(tour_hotel)
      t = tour_hotel.active_tour.tour
      "#{t.title}##{t.id}"
    end

    def pretty_date(date)
      d = date.to_formatted_s(:rfc822).split(' ')
      d[1].upcase!
      d.join('-')
    end
  end
end
