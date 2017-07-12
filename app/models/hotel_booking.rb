class HotelBooking < ApplicationRecord
  belongs_to :hotel_room
  belongs_to :tour_booking
end
