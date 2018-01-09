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

class HotelOptionHotelBooking < ApplicationRecord
  belongs_to :hotel_booking
  belongs_to :hotel_option
end
