class ActiveTour < ApplicationRecord
  has_many :tour_bookings, dependent: :destroy
  belongs_to :tour

  validates :tour, :start_date, :end_date, presence: true

  rails_admin do
    parent Tour
  end

  def title
    "#{tour.title} [#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}]"
  rescue
    'New Active Tour'
  end
end
