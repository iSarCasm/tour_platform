# == Schema Information
#
# Table name: coach_options
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoachOption < ApplicationRecord
  has_many :coach_option_coach_bookings, dependent: :destroy
  has_many :coach_booking, through: :coach_option_coach_bookings, inverse_of: :coach_options
end
