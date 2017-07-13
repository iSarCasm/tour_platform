class Hotel < ApplicationRecord
  has_many :tour_hotels

  validates :title, presence: true
end
