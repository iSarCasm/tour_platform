class User < ApplicationRecord
  has_many :tour_bookings, dependent: :destroy, inverse_of: :user

  validates :name, presence: true

  rails_admin do
    edit do
      exclude_fields :tour_bookings
    end
  end
end
