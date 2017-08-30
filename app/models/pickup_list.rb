class PickupList < ApplicationRecord
  belongs_to :tour_coach, inverse_of: :pickup_list
  has_many :pickup_points, inverse_of: :pickup_list, dependent: :destroy

  accepts_nested_attributes_for :pickup_points, allow_destroy: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
  end

  def title
    "Pickup list: #{tour_coach.title}"
  end
end
