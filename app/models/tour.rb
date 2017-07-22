class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy, inverse_of: :tour

  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  extend FriendlyId
  friendly_id :title, use: :slugged
end
