class HotelRoom < ApplicationRecord
  has_many :hotel_bookings

  enum room_type: [ :Single, :Double ]

  belongs_to :tour_hotel

  validates :tour_hotel, :room_type, :number, :places, presence: true

  def title
    "#{short_title} (#{room_type}, for #{places} people)"
  end

  def short_title
    "#{tour_hotel.hotel_title} ##{number}"
  end

  def booking_period
    tour_hotel.booking_period
  end
end
