class ActiveTour < ApplicationRecord
  has_many :tour_bookings
  belongs_to :tour

  validates :start_date, :end_date, presence: true
end
