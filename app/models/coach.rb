# == Schema Information
#
# Table name: coaches
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :text
#  phone_number     :string
#  fax_number       :string
#  website          :text
#  email            :string
#  contact_name     :string
#  emergency_number :string
#  seatplan_id      :integer
#  rating           :decimal(, )
#

class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy, inverse_of: :coach
  has_many :photos, as: :photoable, class_name: 'Photo'
  has_many :notes, as: :noteable
  # Defaults
  belongs_to :seatplan, inverse_of: :coaches, optional: true
  has_many :seat_prices, dependent: :destroy, inverse_of: :coach
  has_many :coach_amenities, dependent: :destroy
  has_many :amenities, through: :coach_amenities

  accepts_nested_attributes_for :seat_prices, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true

  def tour_coaches_count
    tour_coaches.count
  end
end
