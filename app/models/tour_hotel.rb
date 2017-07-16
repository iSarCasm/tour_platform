class TourHotel < ApplicationRecord
  has_many :hotel_rooms, dependent: :destroy, inverse_of: :tour_hotel
  belongs_to :hotel, inverse_of: :tour_hotels
  belongs_to :active_tour, inverse_of: :tour_hotels

  validates :hotel, :active_tour, presence: true

  accepts_nested_attributes_for :hotel_rooms, allow_destroy: true

  rails_admin do
    parent Hotel
  end

  def title
    "#{hotel.title} #{booking_period}"
  rescue
    'New Tour Hotel'
  end

  def booking_period
    "[#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}]"
  end

  def hotel_title
    hotel.title
  end
end
