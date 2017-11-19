# == Schema Information
#
# Table name: tour_coaches
#
#  id             :integer          not null, primary key
#  coach_id       :integer
#  active_tour_id :integer
#  departure_date :datetime
#  arrival_date   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  driver_name    :string
#  driver_number  :string
#  notes          :text
#  seatplan_id    :integer
#  rate           :decimal(, )
#

class TourCoach < ApplicationRecord
  has_many :coach_bookings, dependent: :destroy, inverse_of: :tour_coach
  belongs_to :coach, inverse_of: :tour_coaches
  belongs_to :active_tour, inverse_of: :tour_coaches
  belongs_to :seatplan, inverse_of: :tour_coaches
  has_many :tour_amenities, dependent: :destroy
  has_many :amenities, through: :tour_amenities
  has_many :seat_prices, inverse_of: :tour_coach

  has_one :pickup_list, inverse_of: :tour_coach, dependent: :destroy

  accepts_nested_attributes_for :seat_prices, allow_destroy: true
  accepts_nested_attributes_for :pickup_list, allow_destroy: true

  validates :coach, :active_tour, :departure_date, :arrival_date, :seatplan, presence: true

  def title
    "#{coach.title} " \
      "[#{departure_date.to_date.to_formatted_s(:rfc822)} - " \
      "#{arrival_date.to_date.to_formatted_s(:rfc822)}]"
  rescue
    'New Tour Coach'
  end

  def coach_title
    coach.title
  end

  def coach_bookings_count
    coach_bookings.count
  end

  def seats
    seatplan&.total_seats || 0 # TODO: remove later (only appeared with invalid models)
  end

  def seats_left
    seats - coach_bookings.map(&:seats_amount).reduce(0, &:+)
  end

  def available?
    seats_left > 0 && !pickup_list.nil? # TODO: remove later (only appeared with invalid models)
  end

  def seat_types
    seatplan.seat_types
  end

  def seat_price(seat)
    seat_type = seatplan.get_seat(*seat.split('_').map(&:to_i))
    modify_seat_type_price(seat_type).price
  end

  def json_seat_types
    seat_types.each.with_object({}) do |seat, h|
      seat = modify_seat_type_price(seat)
      h.merge! seat.json
    end
  end

  def pickup_points
    pickup_list.pickup_points
  end

  def modify_seat_type_price(seat_type)
    seat_price = seat_prices.where(char: seat_type.char).take
    seat_type.price = seat_price.price if seat_price
    seat_type
  end
end
