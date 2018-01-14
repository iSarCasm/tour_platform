# == Schema Information
#
# Table name: hotel_options
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HotelOption < ApplicationRecord
  has_many :hotel_option_hotel_bookings, dependent: :destroy
  has_many :hotel_booking, through: :hotel_option_hotel_bookings, inverse_of: :hotel_options
end
