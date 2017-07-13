class HotelRoom < ApplicationRecord
  has_many :hotel_bookings

  enum room_type: [ :Single, :Double ]

  belongs_to :tour_hotel

  validates :tour_hotel, :room_type, :number, :places, presence: true
end
