# == Schema Information
#
# Table name: hotel_bookings
#
#  id              :integer          not null, primary key
#  hotel_room_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe HotelBooking do
  describe 'create valiadtions' do
    it 'ensure has enough rooms' do
      hotel_room = create :hotel_room, amount: 0
      booking = build :hotel_booking, hotel_room: hotel_room
      expect(booking.save).to eq false
    end
  end

  describe '#title' do
    it 'shows readable represenation' do
      user = build :user, name: 'Jason'
      tour_booking = build :tour_booking, user: user

      hotel = build :hotel, title: 'Big Pen'
      tour_hotel = build(:tour_hotel,
        hotel: hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28),
      )
      hotel_room = build(:hotel_room,
        amount: 134,
        tour_hotel: tour_hotel,
        room_type: build(:room_type, room_type: 'Single')
      )
      hotel_booking = build :hotel_booking, hotel_room: hotel_room, tour_booking: tour_booking

      expect(hotel_booking.title).to eq 'Jason -> Big Pen: Single [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#tour_hotel' do
    it 'returns TourHotel of given HotelBooking' do
      th = create :tour_hotel
      hr = create :hotel_room, tour_hotel: th
      hb = create :hotel_booking, hotel_room: hr
      expect(hb.tour_hotel).to eq th
    end
  end

  describe '#total_cost' do
    it 'return sum cost' do
      tb = create :tour_booking, adult: 1, senior: 2
      hr = create :hotel_room, adult: 30, adult_supp: 5, senior: 40, senior_supp: 20
      hb = create :hotel_booking, hotel_room: hr, tour_booking: tb

      expect(hb.total_cost).to eq(30 + 5 + 40*2 + 20*2)
    end
  end
end
