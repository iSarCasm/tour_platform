# == Schema Information
#
# Table name: tour_coaches
#
#  id             :integer          not null, primary key
#  coach_id       :integer
#  active_tour_id :integer
#  departure_date :datetime
#  arrival_date   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  driver_name    :string
#  driver_number  :string
#  notes          :text
#  seatplan_id    :integer
#

class TourCoach < ApplicationRecord
  has_many :coach_bookings, dependent: :destroy, inverse_of: :tour_coach
  belongs_to :coach, inverse_of: :tour_coaches
  belongs_to :active_tour, inverse_of: :tour_coaches
  belongs_to :seatplan, inverse_of: :tour_coaches
  has_many :tour_coach_amenities, dependent: :destroy
  has_many :coach_amenities, through: :tour_coach_amenities

  validates :coach, :active_tour, :departure_date, :arrival_date, :seatplan, presence: true

  rails_admin do
    parent Coach
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :coach_bookings, :tour_coach_amenities
    end
    show do
      exclude_fields :tour_coach_amenities
    end
  end

  def title
    "#{coach.title} " \
      "[#{departure_date.to_date.to_formatted_s(:rfc822)} - " \
      "#{arrival_date.to_date.to_formatted_s(:rfc822)}]"
  rescue
    'New Tour Coach'
  end

  def seats
    seatplan&.total_seats || 0 # TODO: remove later (only appeared with invalid models)
  end

  def seats_left
    seats - coach_bookings.map(&:seats_amount).reduce(0, &:+)
  end

  def available?
    seats_left > 0
  end
end
