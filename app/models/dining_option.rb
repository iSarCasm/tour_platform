# == Schema Information
#
# Table name: dining_options
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DiningOption < ApplicationRecord
  has_many :dining_option_hotel_bookings, dependent: :destroy
  has_many :hotel_booking, through: :dining_option_hotel_bookings, inverse_of: :dining_options
end
