class User < ApplicationRecord
  has_many :tour_bookings, dependent: :destroy

  validates :name, presence: true
end
