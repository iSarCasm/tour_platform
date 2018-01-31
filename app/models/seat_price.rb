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
#  coach_id      :integer
#

class SeatPrice < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :seat_prices, optional: true
  belongs_to :coach, inverse_of: :seat_prices, optional: true

  validates :char, :price, presence: true
end
