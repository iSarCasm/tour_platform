class BookingWizard::Base
  include Rails.application.routes.url_helpers

  attr_reader :params, :session, :attributes

  def initialize(params:, session:)
    @params   = params
    @session  = session
    step_initialize
  end

  def view
    "tour_bookings/booking_wizard/step#{current_step}"
  end

  def next_step_path
    new_tour_booking_path active_tour_slug: params[:active_tour_slug], step: current_step + 1
  end

  private

  def current_step
    self.class.to_s.scan(/\d+/).first.to_i
  end
end