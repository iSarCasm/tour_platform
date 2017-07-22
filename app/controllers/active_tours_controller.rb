class ActiveToursController < ApplicationController
  load_and_authorize_resource

  def show
    @booking = TourBooking.new

    @tour = @active_tour.tour
    @tour_coach = @active_tour.tour_coaches.first
    @booking.coach_bookings.build

    @active_tour.tour_hotels.each do |hotel|
      hotel_booking = @booking.hotel_bookings.build(tour_booking: @booking)
      hotel_booking.configure_for_form(hotel)
    end
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
    params.require(:tour_booking).permit(
      :active_tour_id,
      coach_bookings_attributes: [:tour_coach_id, :seats],
      hotel_bookings_attributes: [:hotel_room_id]
    )
  end
end
