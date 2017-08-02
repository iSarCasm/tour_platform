class RoomType < ApplicationRecord
  has_many :hotel_rooms, inverse_of: :room_type

  validates :room_type, presence: true
  validates :pax, presence: true, numericality: { greater_than: 0 }

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :created_at, :updated_at, :id
    end
  end

  def name
    room_type
  end
end
