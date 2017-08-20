class ActiveToursController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  before_action :make_seats_array, only: [:book]

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
    gon.seat_types = SeatType.json
    gon.reserved_seats = @tour_coach.coach_bookings.pluck(:seats).flatten
  end

  def book
    @booking = current_user.tour_bookings.new(booking_params)
    if @booking.save
      flash[:notice] = 'Successfuly ordered a tour!'
      redirect_to root_url
    else
      flash[:error] = @booking.errors
      redirect_back
    end
  end

  private

  def booking_params
    @booking_params ||= params.require(:tour_booking).permit(
      :active_tour_id,
      coach_bookings_attributes: [:tour_coach_id, :seats],
      hotel_bookings_attributes: [:hotel_room_id]
    )
  end

  def make_seats_array
    seats = booking_params["coach_bookings_attributes"]["0"]["seats"]
    booking_params["coach_bookings_attributes"]["0"]["seats"] = JSON.parse(seats) unless seats.kind_of? Array
  end
end
