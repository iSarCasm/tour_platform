class ActiveTour < ApplicationRecord
  has_many :tour_bookings, dependent: :destroy, inverse_of: :active_tour
  has_many :tour_hotels, dependent: :destroy, inverse_of: :active_tour
  has_many :tour_coaches, dependent: :destroy, inverse_of: :active_tour
  belongs_to :tour, inverse_of: :active_tours

  accepts_nested_attributes_for :tour_hotels, allow_destroy: true
  accepts_nested_attributes_for :tour_coaches, allow_destroy: true

  validates :tour, :start_date, :end_date, presence: true

  rails_admin do
    parent Tour
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :tour_bookings
    end
  end

  def title
    "#{tour.title} [#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}]"
  rescue
    'New Active Tour'
  end
end
