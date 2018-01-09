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

class DiningOptionHotelBooking < ApplicationRecord
  belongs_to :hotel_booking
  belongs_to :dining_option
end
