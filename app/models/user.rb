class User < ApplicationRecord
  has_many :tour_bookings, dependent: :destroy, inverse_of: :user

  validates :name, presence: true
end
