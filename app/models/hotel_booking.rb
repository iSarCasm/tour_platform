class HotelBooking < ApplicationRecord
  belongs_to :hotel_room, inverse_of: :hotel_bookings
  belongs_to :tour_booking, inverse_of: :hotel_bookings

  validates :hotel_room, :tour_booking, presence: true

  validate :ensure_has_rooms, on: :create

  rails_admin do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  def title
    "#{tour_booking.username} -> #{hotel_room.short_title} [#{hotel_room.booking_period}]"
  rescue
    'New Hotel Booking'
  end

  def configure_for_form(hotel)
    define_singleton_method(:hotel_title) { hotel.hotel_title.to_s }
    define_singleton_method(:booking_period_fancy) { hotel.booking_period_fancy.to_s }
    available_rooms = hotel.hotel_rooms.available.to_a
    define_singleton_method(:rooms) do
      (available_rooms.empty? ? [ 'No rooms available' ] : available_rooms.collect { |p| [ p.customer_title, p.id ] })
    end
  end

  def ensure_has_rooms
    return unless hotel_room
    if hotel_room.amount_left < 1
      errors.add :hotel_room, 'Rooms of this type sold out!'
    end
  end
end
