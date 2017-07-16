class TourHotel < ApplicationRecord
  has_many :hotel_rooms, dependent: :destroy
  belongs_to :hotel
  belongs_to :active_tour

  validates :hotel, :active_tour, presence: true

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
