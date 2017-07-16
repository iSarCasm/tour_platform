class Hotel < ApplicationRecord
  has_many :tour_hotels, dependent: :destroy

  validates :title, presence: true
end
