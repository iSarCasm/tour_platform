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
    Passenger   = Struct.new(:seat, :name, :number, :booking_ref, :pax_type, :requests_and_options)

    def pickup_points(tour_coach)
      pickup_points = tour_coach.pickup_list&.pickup_points || []
      pickup_points.each.with_object([]) do |point, points|
        bookings = TourBooking.joins(:coach_bookings)
                              .where(coach_bookings: {pickup_point: point})
        points << PickupPoint.new(
          tour_coach.departure_date.strftime('%H:%M'),
          point.address,
          bookings.map do |booking|
            Passenger.new(booking.coach_booking.seat_objects.map(&:number), booking.user.full_name, booking.user.phone_mobile, booking.id, 'missing', 'missing')
          end
        )
      end
    end
  end
end
