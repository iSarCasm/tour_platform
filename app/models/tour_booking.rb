class TourBooking < ApplicationRecord
  belongs_to :active_tour
  belongs_to :user
end
