class HotelRoom < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :hotel_room

  belongs_to :tour_hotel, inverse_of: :hotel_rooms

  enum room_type: [ :Single, :Double ]

  validates :tour_hotel, :room_type, :number, :places, presence: true

  rails_admin do
    parent TourHotel
    edit do
      exclude_fields :hotel_bookings
    end
  end

  def title
    "#{short_title} (#{room_type}, for #{places} people)"
  rescue
    'New Hotel Room'
  end

  def short_title
    "#{tour_hotel.hotel_title} ##{number}"
  end

  def booking_period
    tour_hotel.booking_period
  end
end
