class User < ApplicationRecord
  has_many :tour_bookings

  validates :name, presence: true
end
