class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy, inverse_of: :coach

  validates :title, presence: true
end
