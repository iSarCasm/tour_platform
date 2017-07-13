class TourHotel < ApplicationRecord
  belongs_to :hotel
  belongs_to :active_tour

  validates :hotel, :active_tour, presence: true
end
