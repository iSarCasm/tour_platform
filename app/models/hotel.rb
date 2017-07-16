class Hotel < ApplicationRecord
  has_many :tour_hotels, dependent: :destroy, inverse_of: :hotel

  validates :title, presence: true
end
