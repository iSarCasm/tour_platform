class TourBooking < ApplicationRecord
  belongs_to :active_tour
  belongs_to :user

  validates :active_tour, :user, presence: true
end
