class Tour < ApplicationRecord
  has_many :active_tours

  validates :title, presence: true
end
