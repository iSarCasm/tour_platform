# == Schema Information
#
# Table name: tour_bookings
#
#  id             :integer          not null, primary key
#  active_tour_id :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  adult          :integer
#  child          :integer
#  infant         :integer
#  senior         :integer
#

class TourBooking < ApplicationRecord
  has_many :hotel_bookings, dependent: :destroy, inverse_of: :tour_booking
  has_many :coach_bookings, dependent: :destroy, inverse_of: :tour_booking
  belongs_to :active_tour, inverse_of: :tour_bookings
  belongs_to :user, inverse_of: :tour_bookings

  accepts_nested_attributes_for :hotel_bookings, allow_destroy: true
  accepts_nested_attributes_for :coach_bookings, allow_destroy: true

  validates :active_tour, :user, presence: true

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  def title
    "#{user.name} -> #{active_tour.title}"
  rescue
    'New Tour Booking'
  end

  def coach_booking
    coach_bookings.first
  end

  def username
    user.name
  end

  def tour
    active_tour.tour
  end

  def tour_title
    active_tour.tour_title
  end

  def active_tour_title
    active_tour.title
  end
end
