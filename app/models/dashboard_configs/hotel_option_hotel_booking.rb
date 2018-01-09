# == Schema Information
#
# Table name: hotel_option_hotel_bookings
#
#  id               :integer          not null, primary key
#  hotel_booking_id :integer
#  hotel_option_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

RailsAdmin.config do |config|
  config.model HotelOptionHotelBooking do
    hide
  end
end
