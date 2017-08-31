# == Schema Information
#
# Table name: seat_prices
#
#  id            :integer          not null, primary key
#  char          :string
#  price         :decimal(, )
#  tour_coach_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SeatPrice < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :seat_prices

  rails_admin do
    navigation_label 'Settings'
    weight 999
  end
end
