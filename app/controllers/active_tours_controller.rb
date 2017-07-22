class ActiveToursController < ApplicationController
  def show
    @active_tour = ActiveTour.find(params[:id])
    @tour = @active_tour.tour
    @booking = TourBooking.new

    @tour_coach = @active_tour.tour_coaches.first
    @booking.coach_bookings.build

    @active_tour.tour_hotels.each do |hotel|
      hotel_booking = @booking.hotel_bookings.build(tour_booking: @booking)
      hotel_booking.define_singleton_method(:hotel_title) { hotel.hotel_title.to_s }
      hotel_booking.define_singleton_method(:booking_period_fancy) { hotel.booking_period_fancy.to_s }
      available_rooms = hotel.hotel_rooms.available.to_a
      hotel_booking.define_singleton_method(:rooms) do
        (available_rooms.empty? ? [ 'No rooms available' ] : available_rooms.collect { |p| [ p.title, p.id ] })
      end
    end
  end

  def book
    if current_user
      @booking = current_user.tour_bookings.new(booking_params)

      if @booking.save
        flash[:notice] = 'Successfuly ordered a tour!'
        redirect_to root_url
      else
        flash[:alert] = @booking.errors
        redirect_back
      end
    else
      redirect_to new_user_session_path
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
