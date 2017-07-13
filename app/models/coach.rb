class Coach < ApplicationRecord
  has_many :tour_coaches

  validates :title, presence: true
end
