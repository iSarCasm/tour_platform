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
      exclude_fields :created_at, :updated_at
    end
  end
end
