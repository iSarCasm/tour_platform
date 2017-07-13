class ActiveTour < ApplicationRecord
  belongs_to :tour

  validates :start_date, :end_date, presence: true
end
