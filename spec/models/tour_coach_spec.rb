require 'rails_helper'

describe TourCoach do
  describe '#title' do
    it 'shows readable represenation' do
      coach = build :coach, title: 'Fast Moves'
      tour_coach = build(:tour_coach,
        coach: coach,
        departure_date: Date.new(2017, 7, 14),
        arrival_date: Date.new(2017, 7, 28)
      )
      expect(tour_coach.title).to eq 'Fast Moves [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#seats_left' do
    it 'returns number of seats left for booking' do
      tour_coach = create :tour_coach, seats: 40
      create_list :coach_booking, 15, tour_coach: tour_coach
      expect(tour_coach.seats_left).to eq 25
    end
  end

  desctive 'available?' do
    it 'returns if has any seats for booking' do
      tour_coach = create :tour_coach, seats: 40
      create_list :coach_booking, 15, tour_coach: tour_coach
      expect(tour_coach.available?).to eq true
      create_list :coach_booking, 25, tour_coach: tour_coach
      expect(tour_coach.available?).to eq false
    end
  end
end
