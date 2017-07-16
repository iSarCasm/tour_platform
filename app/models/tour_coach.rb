class TourCoach < ApplicationRecord
  has_many :coach_bookings
  belongs_to :coach
  belongs_to :active_tour

  validates :coach, :active_tour, :departure_date, :arrival_date, presence: true

  def title
    "#{coach.title} " +
    "[#{departure_date.to_date.to_formatted_s(:rfc822)} - " +
    "#{arrival_date.to_date.to_formatted_s(:rfc822)}]"
  end
end
