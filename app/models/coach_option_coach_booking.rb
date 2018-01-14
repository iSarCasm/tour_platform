# == Schema Information
#
# Table name: coach_option_coach_bookings
#
#  id               :integer          not null, primary key
#  coach_booking_id :integer
#  coach_option_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CoachOptionCoachBooking < ApplicationRecord
  belongs_to :coach_booking
  belongs_to :coach_option
end
