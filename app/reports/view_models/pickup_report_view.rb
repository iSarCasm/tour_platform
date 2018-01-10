class PickupReportView
  class << self
    def for(tour_coach:)
      {
        tour_id: tour_id(tour_coach),
        tour_name: tour_name(tour_coach),
        departure_date: departure_date(tour_coach),
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

    PickupPoint = Struct.new(:time, :address, :passengers)
    Passenger = Struct.new(:tour_booking) do
      def seat
        tour_booking.coach_booking.seat_objects.map(&:number)
      end

      def name
        tour_booking.user.full_name
      end

      def number
        tour_booking.user.phone_mobile
      end

      def booking_ref
        tour_booking.id
      end

      def pax_type
        'TODO'
      end

      def requests_and_options
        tour_booking.coach_booking.coach_options.pluck(:title).join(', ')
      end
    end

    def pickup_points(tour_coach)
      pickup_points = tour_coach.pickup_list&.pickup_points || []
      pickup_points.each.with_object([]) do |point, points|
        bookings = TourBooking.joins(:coach_bookings)
                              .where(coach_bookings: {pickup_point: point})
        points << PickupPoint.new(
          tour_coach.departure_date.strftime('%H:%M'),
          point.address,
          bookings.map { |booking| Passenger.new(booking) }
        )
      end
    end
  end
end
