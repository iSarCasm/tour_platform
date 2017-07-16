require 'rails_helper'

describe HotelRoom do
  describe '#title' do
    it 'shows readable represenation' do
      hotel = build :hotel, title: 'Big Pen'
      tour_hotel = build :tour_hotel, hotel: hotel
      hotel_room = build(:hotel_room,
        tour_hotel: tour_hotel,
        number: 134,
        places: 4,
        room_type: :Double
      )
      expect(hotel_room.title).to eq 'Big Pen #134 (Double, for 4 people)'
    end
  end
end
