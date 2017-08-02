class HotelRoom < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :hotel_room

  belongs_to :room_type, inverse_of: :hotel_rooms
  belongs_to :tour_hotel, inverse_of: :hotel_rooms

  validates :tour_hotel, :room_type, :amount, presence: true

  scope :available, -> { left_outer_joins(:hotel_bookings).group('hotel_rooms.id').having('count(hotel_room_id) < amount') }

  rails_admin do
    parent TourHotel
    list do
      field :tour_hotel
      field :amount
      field :pax
      field :hotel_bookings
    end
    edit do
      exclude_fields :hotel_bookings
    end
  end

  def title
    "#{tour_hotel.hotel_title} (#{customer_title})"
  rescue
    'New Hotel Room'
  end

  def customer_title
    "#{room_type_name}, for #{pax} people"
  end

  def short_title
    "#{tour_hotel.hotel_title}: #{room_type_name}"
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

  def pax
    room_type.pax
  end

  def room_type_name
    room_type.room_type
  end
end
