class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy, inverse_of: :coach

  validates :title, presence: true

  rails_admin do
    edit do
      exclude_fields :tour_coaches
    end
  end
end
