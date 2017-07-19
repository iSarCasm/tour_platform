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
      hotel_booking.define_singleton_method(:rooms) do
        hotel.hotel_rooms.collect { |p| [ p.title, p.id ] }
      end
    end
  end

  def book
    @booking = TourBooking.new(booking_params)

    if @booking.save
      redirect_to root_url
    else
      flash[:notice] = @booking.errors.messages
      redirect_to root_url
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
