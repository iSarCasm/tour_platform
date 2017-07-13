class HotelRoom < ApplicationRecord
  enum room_type: [ :Single, :Double ]

  belongs_to :hotel

  validates :hotel, :room_type, :number, :places, presence: true
end
