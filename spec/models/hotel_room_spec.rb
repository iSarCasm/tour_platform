require 'rails_helper'

describe HotelRoom do
  describe 'scope .available' do
    it 'returns rooms with amont_left > 0' do
      r = create :hotel_room, amount: 10
      expect(HotelRoom.available.length).to eq 1
      r.update(amount: 0)
      expect(HotelRoom.available.length).to eq 0
    end
  end

  describe '#title' do
    it 'shows readable represenation' do
      hotel = build :hotel, title: 'Big Pen'
      tour_hotel = build :tour_hotel, hotel: hotel
      hotel_room = build(:hotel_room,
        tour_hotel: tour_hotel,
        amount: 134,
        places: 4,
        room_type: :Double
      )
      expect(hotel_room.title).to eq 'Big Pen (Double, for 4 people)'
    end
  end

  describe '#amount_left' do
    it 'returns number of rooms left for this type' do
      hotel_room = create :hotel_room, amount: 10
      create_list :hotel_booking, 7, hotel_room: hotel_room
      expect(hotel_room.amount_left).to eq 3
    end
  end

  describe '#available?' do
    it 'says if this rooms are still available for booking' do
      hotel_room = create :hotel_room, amount: 10
      create_list :hotel_booking, 7, hotel_room: hotel_room
      expect(hotel_room.available?).to eq true
      create_list :hotel_booking, 3, hotel_room: hotel_room
      expect(hotel_room.available?).to eq false
    end
  end
end
