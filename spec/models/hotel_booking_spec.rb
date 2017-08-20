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
end
