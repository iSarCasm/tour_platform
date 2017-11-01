# == Schema Information
#
# Table name: hotel_rooms
#
#  id            :integer          not null, primary key
#  tour_hotel_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amount        :integer
#  room_type_id  :integer
#  adult_buy     :decimal(, )      default(0.0)
#  adult_supp    :decimal(, )      default(0.0)
#  child_buy     :decimal(, )      default(0.0)
#  infant_buy    :decimal(, )      default(0.0)
#  senior_buy    :decimal(, )      default(0.0)
#  senior_supp   :decimal(, )      default(0.0)
#  hotel_id      :integer
#  adult_sell    :decimal(, )      default(0.0)
#  senior_sell   :decimal(, )      default(0.0)
#  child_sell    :decimal(, )      default(0.0)
#  infant_sell   :decimal(, )      default(0.0)
#

class HotelRoom < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :hotel_room

  belongs_to :room_type, inverse_of: :hotel_rooms
  belongs_to :tour_hotel, inverse_of: :hotel_rooms, optional: true
  belongs_to :hotel, inverse_of: :hotel_rooms, optional: true

  validates :room_type, :amount, presence: true

  scope :available, lambda {
    left_outer_joins(:hotel_bookings)
      .group('hotel_rooms.id')
      .having('count(hotel_room_id) < amount')
  }

  def title
    "#{tour_hotel.hotel_title} (#{customer_title})"
  rescue
    'New Hotel Room'
  end

  def customer_title
    "#{room_type_name}, for #{pax} people"
  end

  def short_title
    "#{tour_hotel.hotel_title}: #{room_type_name}"
  end

  def booking_period
    tour_hotel.booking_period
  end

  def hotel_bookings_count
    hotel_bookings.count
  end

  def amount_left
    amount - hotel_bookings.count
  end

  def available?
    amount_left > 0
  end

  def pax
    room_type.pax
  end

  def room_type_name
    room_type.room_type
  end
end
