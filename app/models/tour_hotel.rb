class TourHotel < ApplicationRecord
  has_many :hotel_rooms
  belongs_to :hotel
  belongs_to :active_tour

  validates :hotel, :active_tour, presence: true

  def title
    "#{hotel.title} #{booking_period}"
  end

  def booking_period
    "[#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}]"
  end

  def hotel_title
    hotel.title
  end
end
