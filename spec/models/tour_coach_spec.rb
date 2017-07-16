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
end
