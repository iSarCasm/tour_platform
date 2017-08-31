class ActiveToursController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  def show
    @booking = TourBooking.new
    @tour = @active_tour.tour
    @tour_coach = @active_tour.tour_coaches.first
    @booking.coach_bookings.build

    @active_tour.tour_hotels.includes(hotel: :photos).each do |hotel|
      hotel_booking = @booking.hotel_bookings.build(tour_booking: @booking)
      hotel_booking.configure_for_form(hotel)
    end

    gon.seatplan = @tour_coach.seatplan.plan
    gon.seat_types = @tour_coach.json_seat_types
    gon.reserved_seats = @tour_coach.coach_bookings.pluck(:seats).flatten
  end
end
