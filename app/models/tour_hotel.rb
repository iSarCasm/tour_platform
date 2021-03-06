# == Schema Information
#
# Table name: tour_hotels
#
#  id                :integer          not null, primary key
#  hotel_id          :integer
#  active_tour_id    :integer
#  start_date        :date
#  end_date          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_basis_id    :integer
#  payment_type_id   :integer
#  finalisation_date :datetime
#  hotel_theme       :string
#

class TourHotel < ApplicationRecord
  has_many :hotel_rooms, dependent: :destroy, inverse_of: :tour_hotel
  belongs_to :hotel, inverse_of: :tour_hotels
  belongs_to :active_tour, inverse_of: :tour_hotels, optional: true
  belongs_to :board_basis, inverse_of: :tour_hotels, optional: true
  belongs_to :payment_type, inverse_of: :tour_hotels, optional: true
  has_many :notes, as: :noteable

  accepts_nested_attributes_for :hotel_rooms, allow_destroy: true

  def title
    "#{hotel_title} [#{booking_period}]"
  rescue
    'New Tour Hotel'
  end

  def hotel_title
    hotel.title
  end

  def photos
    hotel.photos
  end

  def hotel_rooms_bookings
    HotelBooking.left_outer_joins(:hotel_room)
                .select("hotel_bookings.*, hotel_rooms.tour_hotel_id as tour_hotel_id")
                .where("tour_hotel_id = ?", id)
  end

  def hotel_rooms_count
    hotel_rooms.count
  end

  def booking_period
    "#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}"
  end

  def booking_period_fancy
    "#{start_date.strftime("%d %B")} - #{end_date.strftime("%d %B")}"
  end

  def available?
    hotel_rooms.any? { |r| r.available? }
  end

  def days
    nights + 1
  end

  def nights
    (end_date - start_date).to_i
  end
end
