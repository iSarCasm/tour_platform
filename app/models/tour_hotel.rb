class TourHotel < ApplicationRecord
  belongs_to :hotel
  belongs_to :active_tour
end
