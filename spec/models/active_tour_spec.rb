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

  describe '#nights' do
    it 'returns number of nights beetween two dates' do
      active_tour = build(:active_tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(active_tour.nights).to eq 14
      expect(active_tour.nights.class).to eq Fixnum
    end
  end

  describe '#days' do
    it 'returns number of days beetween two dates' do
      active_tour = build(:active_tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(active_tour.days).to eq 15
      expect(active_tour.days.class).to eq Fixnum
    end
  end
end
