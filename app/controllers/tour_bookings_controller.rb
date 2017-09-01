class TourBookingsController < ApplicationController
  load_and_authorize_resource

  before_action :make_seats_array, only: [:create]

  def create
    @tour_booking = current_user.tour_bookings.new(tour_booking_params)
    if @tour_booking.save
      flash[:notice] = 'Successfuly ordered a tour!'
      redirect_to @tour_booking
    else
      flash[:error] = @tour_booking.errors
      redirect_back
    end
  end

  def show
    @tour_coach = @tour_booking.coach_bookings.first.tour_coach
    gon.seatplan = @tour_coach.seatplan.plan
    gon.seat_types = @tour_coach.json_seat_types
    gon.reserved_seats = @tour_booking.coach_bookings.first.seats
  end

  def index; end

  def destroy; end

  private

  def tour_booking_params
    @tour_booking_params ||= params.require(:tour_booking).permit(
      :active_tour_id, :adult, :child, :infant, :senior,
      coach_bookings_attributes: [:tour_coach_id, :seats],
      hotel_bookings_attributes: [:hotel_room_id]
    )
  end

  def make_seats_array
    seats = tour_booking_params['coach_bookings_attributes']['0']['seats']
    tour_booking_params['coach_bookings_attributes']['0']['seats'] = JSON.parse(seats) unless seats.is_a? Array
  end
end
