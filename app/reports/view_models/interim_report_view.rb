class InterimReportView
  class << self
    def for(tour_hotel:)
      {
        grouped_bookings: grouped_bookings(tour_hotel),
        hotel_title: hotel_title(tour_hotel),
        board_basis: tour_hotel.board_basis.title,
        arrival_date: pretty_date(tour_hotel.start_date),
        departure_date: pretty_date(tour_hotel.end_date),
        nights: tour_hotel.nights,
        tour_ref: tour_ref(tour_hotel)
      }
    end

    private

    def grouped_bookings(tour_hotel)
      bookings = HotelBooking.joins(:hotel_room)
                             .where(hotel_rooms: { tour_hotel: tour_hotel })
                             .order('hotel_rooms.room_type_id')
      group_bookings(bookings)
    end

    def group_bookings(bookings)
      last_room_type = nil
      grouped_bookings = []
      bookings.each do |b|
        if last_room_type != b.hotel_room.room_type
          last_room_type = b.hotel_room.room_type
          grouped_bookings << { type: b.hotel_room.room_type, bookings: [] }
        end
        grouped_bookings.last[:bookings] << b
      end
      grouped_bookings
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
