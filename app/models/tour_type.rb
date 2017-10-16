class TourType < ApplicationRecord
  has_many :tours, inverse_of: :tour_type

  validates :name, presence: true
end
