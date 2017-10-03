# == Schema Information
#
# Table name: pickup_points
#
#  id             :integer          not null, primary key
#  pickup_list_id :integer
#  address        :string
#  longitude      :decimal(, )
#  latitude       :decimal(, )
#  time_to_hub    :string
#  time_from_hub  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PickupPoint < ApplicationRecord
  include DashboardSettingsSection

  belongs_to :pickup_list, inverse_of: :pickup_points
  has_many :coach_bookings, inverse_of: :pickup_point

  validates :address, :latitude, :longitude, presence: true
end
