# == Schema Information
#
# Table name: room_types
#
#  id          :integer          not null, primary key
#  room_type   :string
#  pax         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class RoomType < ApplicationRecord
  include DashboardSettingsSection
  
  has_many :hotel_rooms, inverse_of: :room_type

  validates :room_type, presence: true
  validates :pax, presence: true, numericality: { greater_than: 0 }

  rails_admin do
    list do
      field :id
      field :pax
      field :description
      field :hotel_rooms
    end
  end

  def name
    room_type
  end

  def to_s
    name
  end
end
