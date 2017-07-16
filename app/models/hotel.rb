class Hotel < ApplicationRecord
  has_many :tour_hotels, dependent: :destroy, inverse_of: :hotel

  validates :title, presence: true

  rails_admin do
    edit do
      exclude_fields :tour_hotels
    end
  end
end
