require 'rails_helper'

describe ActiveTour do
  describe '#title' do
    it 'shows readable represenation' do
      tour = build :tour, title: 'New tour'
      active_tour = build(:active_tour,
        tour: tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(active_tour.title).to eq 'New tour [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#tour_title' do
    it 'returns title of original tour' do
      tour = build :tour, title: 'New tour'
      active_tour = build :active_tour, tour: tour

      expect(active_tour.tour_title).to eq 'New tour'
    end
  end

  describe '#availabe?' do
    it 'avaialbe if all coaches and hotels are available' do
      active_tour = create :active_tour
      tour_coach = create :tour_coach, active_tour: active_tour, seats: 0
      tour_hotel = create :tour_hotel, active_tour: active_tour
      room_1 = create :hotel_room, tour_hotel: tour_hotel, amount: 0

      expect(active_tour.available?).to eq false
    end
  end
end
