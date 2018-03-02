class TourBookingsController < ApplicationController
  def new
    @wizard = current_step.new(params: params, session: session)
    render @wizard.view
  end

  def create
    @wizard = current_step.new(params: params, session: session)
    if @wizard.save
      session[:booking_wizard] = @wizard.attributes
      redirect_to @wizard.next_step_path
    else
      flash[:error] = @wizard.errors
      render current_step.view    
    end
  end

  def show
    @tour_booking = TourBooking.find(params[:id])
    authorize! :show, @tour_booking

    @tour_coach = @tour_booking.coach_booking.tour_coach
    gon.seatplan = @tour_coach.seatplan.plan
    gon.seat_types = @tour_coach.json_seat_types
    gon.reserved_seats = @tour_booking.coach_bookings.first.seats
  end

  def index; end

  def destroy
    @tour_booking = TourBooking.find(params[:id])
    authorize! :show, @tour_booking

    @tour_booking.destroy
    current_user.user_actions.create(action: 'Canceled a tour')
    redirect_to root_url
  end

  private

  def current_step
    case params[:step]
    when '1' then BookingWizard::Step1
    when '2' then BookingWizard::Step2
    when '3' then BookingWizard::Step3
    else BookingWizard::Step1
    end
  end
end
