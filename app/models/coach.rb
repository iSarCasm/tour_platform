class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy

  validates :title, presence: true
end
