class HotelBooking < ApplicationRecord
  belongs_to :hotel_room
  belongs_to :tour_booking

  validates :hotel_room, :tour_booking, presence: true
end
