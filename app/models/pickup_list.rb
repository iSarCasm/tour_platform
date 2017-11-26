# == Schema Information
#
# Table name: pickup_lists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PickupList < ApplicationRecord
  has_one :tour_coach, inverse_of: :pickup_list
  has_many :pickup_points, inverse_of: :pickup_list, dependent: :destroy

  accepts_nested_attributes_for :pickup_points, allow_destroy: true

  def title
    "PL #{tour_coach.title}"
  rescue
    'New Pickup List'
  end
end
