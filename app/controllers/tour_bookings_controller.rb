class TourBookingsController < ApplicationController
  load_and_authorize_resource

  before_action :make_seats_array, only: [:create]

  def new
    step = params[:step] || 1

    @booking = TourBooking.new
    @active_tour = ActiveTour.find_by(slug: params[:active_tour_slug])
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

    render 'tour_bookings/steps/step1'
  end

  def create
    @tour_booking = current_user.tour_bookings.new(tour_booking_params)
    if @tour_booking.save
      current_user.user_actions.create(action: 'Booked a new tour', subjectable: @tour_booking)
      flash[:notice] = 'Successfuly ordered a tour!'
      redirect_to @tour_booking
    else
      flash[:error] = @tour_booking.errors
      redirect_back
    end
  end

  def show
    @tour_coach = @tour_booking.coach_booking.tour_coach
    gon.seatplan = @tour_coach.seatplan.plan
    gon.seat_types = @tour_coach.json_seat_types
    gon.reserved_seats = @tour_booking.coach_bookings.first.seats
  end

  def index; end

  def destroy
    @tour_booking.destroy
    current_user.user_actions.create(action: 'Canceled a tour')
    redirect_to root_url
  end

  private

  def tour_booking_params
    @tour_booking_params ||= params.require(:tour_booking).permit(
      :active_tour_id, :adult, :child, :infant, :senior,
      coach_bookings_attributes: [:tour_coach_id, :seats, :pickup_point_id],
      hotel_bookings_attributes: [:hotel_room_id]
    )
  end

  def make_seats_array
    seats = tour_booking_params['coach_bookings_attributes']['0']['seats']
    seats = '[]' if seats.empty?
    tour_booking_params['coach_bookings_attributes']['0']['seats'] = JSON.parse(seats) unless seats.is_a? Array
  end
end
