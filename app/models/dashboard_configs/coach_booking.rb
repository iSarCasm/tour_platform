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
      field :tour_coach
      field :tour_booking
      field :seats
      field :pickup_point
      field :coach_options
    end

    edit do
      field :tour_coach
      field :tour_booking
      field :seats
      field :pickup_point
      field :coach_options
    end

    show do
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
