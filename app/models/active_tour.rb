# == Schema Information
#
# Table name: active_tours
#
#  id         :integer          not null, primary key
#  tour_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

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

  extend FriendlyId
  friendly_id :title, use: :slugged

  def title
    "#{tour_title} [#{date_period}]"
  rescue
    'New Active Tour'
  end

  def tour_title
    tour.title
  end

  def date_period
    "#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}"
  end

  def date_period_fancy
    "#{start_date.strftime("%d %B")} - #{end_date.strftime("%d %B")}"
  end

  def available?
    tour_hotels.all? { |h| h.available? } && tour_coaches.all? { |c| c.available? }
  end
end
