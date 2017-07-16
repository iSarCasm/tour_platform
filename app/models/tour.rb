class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy
  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true
end
