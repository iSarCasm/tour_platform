# == Schema Information
#
# Table name: tour_hotels
#
#  id                :integer          not null, primary key
#  hotel_id          :integer
#  active_tour_id    :integer
#  start_date        :date
#  end_date          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_basis_id    :integer
#  payment_type_id   :integer
#  finalisation_date :datetime
#  hotel_theme       :string
#

require 'rails_helper'

describe TourHotel do
  describe '#title' do
    it 'shows readable represenation' do
      hotel = build :hotel, title: 'Grand Plaza'
      tour_hotel = build(:tour_hotel,
        hotel: hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )

      expect(tour_hotel.title).to eq 'Grand Plaza [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#hotel_rooms_bookings' do
    it 'returns all hotel bookings for all rooms of TourHotel' do
      tour_hotel = create :tour_hotel
      room1 = create :hotel_room, tour_hotel: tour_hotel
      room2 = create :hotel_room, tour_hotel: tour_hotel
      bookings1 = create_list :hotel_booking, 3, hotel_room: room1
      bookings2 = create_list :hotel_booking, 2, hotel_room: room2

      expect(tour_hotel.hotel_rooms_bookings.to_a).to match_array bookings1 + bookings2
    end
  end

  describe '#booking_period_fancy' do
    it 'retuns pretty booking period' do
      tour_hotel = build(:tour_hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )

      expect(tour_hotel.booking_period_fancy).to eq '14 July - 28 July'
    end
  end

  describe '#hotel_title' do
    it 'return title of the Hotel' do
      hotel = build :hotel, title: 'Grand Plaza'
      tour_hotel = build :tour_hotel, hotel: hotel

      expect(tour_hotel.hotel_title).to eq 'Grand Plaza'
    end
  end

  describe '#hotel_rooms_count' do
    it 'returns count of associated hotel rooms' do
      tour_hotel = create :tour_hotel
      create_list :hotel_room, 3, tour_hotel: tour_hotel

      expect(tour_hotel.hotel_rooms_count).to eq 3
    end
  end

  describe '#available?' do
    it 'is available if any room is still available' do
      tour_hotel = create :tour_hotel
      create :hotel_room, tour_hotel: tour_hotel, amount: 0

      expect(tour_hotel.available?).to eq false

      create :hotel_room, tour_hotel: tour_hotel, amount: 1
      tour_hotel.reload

      expect(tour_hotel.available?).to eq true
    end
  end

  describe '#hotel_title' do
    it 'returns title of associated hotel' do
      t_hotel = build :tour_hotel
      expect(t_hotel.hotel_title).to eq t_hotel.hotel.title
    end
  end

  describe '#days' do
    it 'returns amount of days in a tour' do
      tour_hotel = build_stubbed(:tour_hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(tour_hotel.days).to eq 15
    end
  end

  describe '#nights' do
    it 'returns amount of nights in a tour' do
      tour_hotel = build_stubbed(:tour_hotel,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(tour_hotel.nights).to eq 14
    end
  end
end
