class HotelRoom < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :hotel_room

  belongs_to :tour_hotel, inverse_of: :hotel_rooms

  enum room_type: [ :Single, :Double ]

  validates :tour_hotel, :room_type, :amount, :places, presence: true

  scope :available, -> { joins(:hotel_bookings).group('hotel_rooms.id').having('count(hotel_room_id) < amount') }

  rails_admin do
    parent TourHotel
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :hotel_bookings
    end
  end

  def title
    "#{tour_hotel.hotel_title} (#{room_type}, for #{places} people)"
  rescue
    'New Hotel Room'
  end

  def short_title
    "#{tour_hotel.hotel_title}: #{room_type}"
  end

  def booking_period
    tour_hotel.booking_period
  end

  def amount_left
    amount - hotel_bookings.count
  end

  def available?
    amount_left > 0
  end
end
