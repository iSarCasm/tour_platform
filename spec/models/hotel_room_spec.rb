# == Schema Information
#
# Table name: hotel_rooms
#
#  id            :integer          not null, primary key
#  tour_hotel_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amount        :integer
#  room_type_id  :integer
#  adult         :decimal(, )      default(0.0)
#  adult_supp    :decimal(, )      default(0.0)
#  child         :decimal(, )      default(0.0)
#  child_supp    :decimal(, )      default(0.0)
#  infant        :decimal(, )      default(0.0)
#  infant_supp   :decimal(, )      default(0.0)
#  senior        :decimal(, )      default(0.0)
#  senior_supp   :decimal(, )      default(0.0)
#

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
        room_type: build(:room_type, pax: 4, room_type: 'Double')
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

  describe '#hotel_bookings_count' do
    it 'returns amount of associated hotel_bookings' do
      hotel_room = create :hotel_room
      create_list :hotel_booking, 3, hotel_room: hotel_room

      expect(hotel_room.hotel_bookings_count).to eq 3
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

  describe '#model_attributes' do
    it 'returns only room related fields' do
      room_type = create(:room_type)
      room = create(:hotel_room, {
        amount: 10,
        adult: 20,
        adult_supp: 30,
        child: 40,
        child_supp: 50,
        senior: 60,
        senior_supp: 70,
        infant: 80,
        infant_supp: 90,
        room_type: room_type
      })

      expect(room.model_attributes).to eq({
        'amount' => 10,
        'adult' => 20,
        'adult_supp' => 30,
        'child' => 40,
        'child_supp' => 50,
        'senior' => 60,
        'senior_supp' => 70,
        'infant' => 80,
        'infant_supp' => 90,
        'room_type_id' => room_type.id
      })
    end
  end
end
