class SeatPrice < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :seat_prices

  rails_admin do
    navigation_label 'Settings'
    weight 999
  end
end
