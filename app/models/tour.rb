class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy

  validates :title, presence: true
end
