class SeatplanReportView
  class << self
    def for(tour_coach:)
      {
        tour_id: tour_id(tour_coach),
        tour_name: tour_name(tour_coach),
        departure_date: departure_date(tour_coach),
        rows: rows(tour_coach),
        cols: cols(tour_coach),
        plan: plan(tour_coach),
        get_seat: get_seat(tour_coach),
        get_seat_type: get_seat_type(tour_coach),
        users: users(tour_coach),
        pickup_points: pickup_points(tour_coach)
      }
    end

    private

    def tour_id(tour_coach)
      tour_coach.active_tour.id
    end

    def tour_name(tour_coach)
      tour_coach.active_tour.tour_title
    end

    def departure_date(tour_coach)
      tour_coach.departure_date.strftime '%A %d %B %Y'
    end

    def rows(tour_coach)
      tour_coach.seatplan.total_rows
    end

    def cols(tour_coach)
      tour_coach.seatplan.total_cols
    end

    def plan(tour_coach)
      tour_coach.seatplan.plan
    end

    def get_seat(tour_coach)
      -> (row, col) { tour_coach.seatplan.get_seat(row, col) }
    end

    def get_seat_type(tour_coach)
      Proc.new do |seat|
        if seat.char == '_'
          :empty
        elsif seat.is_seat
          :seat
        else
          :nonseat
        end
      end
    end

    def bookings(tour_coach)
      tour_coach.coach_bookings
    end

    def users(tour_coach)
      seats(tour_coach).map do |booking|
        booking&.tour_booking&.user&.full_name
      end
    end

    def pickup_points(tour_coach)
      seats(tour_coach).map do |booking|
        booking&.pickup_point&.address
      end
    end

    def seats(tour_coach)
      tour_coach.coach_bookings.each.with_object([]) do |booking, seats|
        booking.seat_objects.each do |seat|
          seats[seat.number] = booking
        end
      end
    end
  end
end
