# == Schema Information
#
# Table name: coach_bookings
#
#  id              :integer          not null, primary key
#  tour_coach_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  seats           :json
#  pickup_point_id :integer
#

RailsAdmin.config do |config|
  config.model CoachBooking do
    parent TourBooking
    list do
      field :id
      field :tour_coach
      field :tour_booking
      field :seats
      field :pickup_point
      field :coach_options
    end

    create { set_template 'coach_booking' }
    update { set_template 'coach_booking' }

    edit do
      field :tour_coach
      field :tour_booking
      field :seats do
        html_attributes rows: 18, cols: 30
      end
      field :pickup_point
      field :coach_options
    end

    show do
      set_template 'coach_booking_show'
      field :id
      field :tour_coach
      field :tour_booking
      field :seats
      field :pickup_point
      field :coach_options
      field :created_at
      field :updated_at
    end
  end
end
