# == Schema Information
#
# Table name: hotel_bookings
#
#  id              :integer          not null, primary key
#  hotel_room_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

RailsAdmin.config do |config|
  config.model HotelBooking do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end
end
