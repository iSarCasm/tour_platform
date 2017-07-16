class HotelBooking < ApplicationRecord
  belongs_to :hotel_room, inverse_of: :hotel_bookings
  belongs_to :tour_booking, inverse_of: :hotel_bookings

  validates :hotel_room, :tour_booking, presence: true

  rails_admin do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  def title
    "#{tour_booking.username} -> #{hotel_room.short_title} #{hotel_room.booking_period}"
  rescue
    'New Hotel Booking'
  end
end
