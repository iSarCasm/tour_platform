class BookingWizard::Step1 < BookingWizard::Base
  attr_reader :tour, :active_tour, :booking

  def step_initialize
    @booking = TourBooking.new
    @active_tour = ActiveTour.find_by(slug: params[:active_tour_slug])
    @tour = @active_tour.tour
    @active_tour.tour_hotels.includes(hotel: :photos).each do |hotel|
      hotel_booking = @booking.hotel_bookings.build(tour_booking: @booking)
      hotel_booking.configure_for_form(hotel)
    end
  end

  def save
    tour_booking = TourBooking.new(tour_booking_params)
    hotel_bookings = create_hotel_bookings(params: hotel_booking_params, tour_booking: tour_booking)
    @attributes = { tour_booking: tour_booking, hotel_bookings: hotel_bookings } 
  end

  private

  def tour_booking_params
    params.require(:tour_booking).permit(:active_tour_id, :adult, :child, :infant, :senior)
  end

  def hotel_booking_params
    params[:hotel_booking].permit!.to_h
  end

  def create_hotel_bookings(params:, tour_booking:)
    params.each_with_object([]) do |(hotel_room_id, amount), bookings|
      amount.to_i.times do
        bookings << HotelBooking.new(tour_booking: tour_booking, hotel_room_id: hotel_room_id)
      end
    end
  end
end