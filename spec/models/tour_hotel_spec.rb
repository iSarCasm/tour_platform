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

  describe '#hotel_title' do
    it 'return title of the Hotel' do
      hotel = build :hotel, title: 'Grand Plaza'
      tour_hotel = build :tour_hotel, hotel: hotel
      expect(tour_hotel.hotel_title).to eq 'Grand Plaza'
    end
  end
end
