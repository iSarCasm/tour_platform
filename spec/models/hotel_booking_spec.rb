require 'rails_helper'

describe HotelBooking do
  describe '#title' do
    it 'shows readable represenation' do
      user = build :user, name: 'Jason'
      tour_booking = build :tour_booking, user: user

      hotel = build :hotel, title: 'Big Pen'
      tour_hotel = build(:tour_hotel,
        hotel: hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      hotel_room = build :hotel_room, number: 134, tour_hotel: tour_hotel
      hotel_booking = build :hotel_booking, hotel_room: hotel_room, tour_booking: tour_booking

      expect(hotel_booking.title).to eq 'Jason -> Big Pen #134 [14 Jul 2017 - 28 Jul 2017]'
    end
  end

end
