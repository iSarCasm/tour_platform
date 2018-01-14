# == Schema Information
#
# Table name: dining_option_hotel_bookings
#
#  id               :integer          not null, primary key
#  hotel_booking_id :integer
#  dining_option_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

RailsAdmin.config do |config|
  config.model DiningOptionHotelBooking do
    hide
  end
end
