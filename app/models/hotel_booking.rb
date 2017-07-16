class HotelBooking < ApplicationRecord
  belongs_to :hotel_room
  belongs_to :tour_booking

  validates :hotel_room, :tour_booking, presence: true

  rails_admin do
    parent TourBooking
  end

  def title
    "#{tour_booking.username} -> #{hotel_room.short_title} #{hotel_room.booking_period}"
  rescue
    'New Hotel Booking'
  end
end
