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

RailsAdmin.config do |config|
  config.model SeatPrice do
    navigation_label 'Settings'
    weight 999
  end
end
