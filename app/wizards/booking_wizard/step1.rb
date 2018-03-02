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
    @attributes = { tour_booking: tour_booking } 
  end

  private

  def tour_booking_params
    params.require(:tour_booking).permit(:active_tour_id, :adult, :child, :infant, :senior)
  end
end