class TourCoach < ApplicationRecord
  has_many :coach_bookings, dependent: :destroy, inverse_of: :tour_coach
  belongs_to :coach, inverse_of: :tour_coaches
  belongs_to :active_tour, inverse_of: :tour_coaches

  validates :coach, :active_tour, :departure_date, :arrival_date, :seats, presence: true

  rails_admin do
    parent Coach
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :coach_bookings
    end
  end

  def title
    "#{coach.title} " +
    "[#{departure_date.to_date.to_formatted_s(:rfc822)} - " +
    "#{arrival_date.to_date.to_formatted_s(:rfc822)}]"
  rescue
    'New Tour Coach'
  end

  def seats_left
    seats - coach_bookings.count
  end

  def available?
    seats_left > 0
  end
end
