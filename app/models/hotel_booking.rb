# == Schema Information
#
# Table name: hotel_bookings
#
#  id              :integer          not null, primary key
#  hotel_room_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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

  def tour_hotel
    hotel_room.tour_hotel
  end

  def configure_for_form(hotel)
    define_singleton_method(:hotel_title) { hotel.hotel_title.to_s }
    define_singleton_method(:booking_period_fancy) { hotel.booking_period_fancy.to_s }
    define_singleton_method(:days) { hotel.days.to_s }
    define_singleton_method(:nights) { hotel.nights.to_s }
    define_singleton_method(:photos) { hotel.photos.to_a }
    define_singleton_method(:hotel_rooms) { hotel.hotel_rooms.available.includes(:room_type).to_a }
    define_singleton_method(:rooms) do
      if hotel_rooms.empty?
        [ 'No rooms available' ]
      else
        hotel_rooms.collect do |p|
          [ p.customer_title, p.id,
            {
              'data-price-adult' => p.adult + p.adult_supp,
              'data-price-child' => p.child + p.child_supp,
              'data-price-infant' => p.infant + p.infant_supp,
              'data-price-senior' => p.senior + p.senior_supp
            }
          ]
        end
      end
    end
  end

  def ensure_has_rooms
    return unless hotel_room
    if hotel_room.amount_left < 1
      errors.add :hotel_room, 'Rooms of this type sold out!'
    end
  end
end
