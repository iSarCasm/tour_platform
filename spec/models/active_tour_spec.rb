# == Schema Information
#
# Table name: active_tours
#
#  id         :integer          not null, primary key
#  tour_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

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

  describe '#date_period_fancy' do
    it 'returns pretty date period of tour' do
      active_tour = build(:active_tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(active_tour.date_period_fancy).to eq '14 July - 28 July'
    end
  end

  describe '#availabe?' do
    it 'avaialbe if all coaches and hotels are available' do
      active_tour = create :active_tour
      tour_coach = create :tour_coach_without_seats, active_tour: active_tour

      tour_hotel = create :tour_hotel, active_tour: active_tour
      room_1 = create :hotel_room, tour_hotel: tour_hotel, amount: 0  # no rooms

      expect(active_tour.available?).to eq false

      room_1.update(amount: 10)
      active_tour.reload

      expect(active_tour.available?).to eq false

      allow(active_tour.tour_coaches.last).to receive(:seats).and_return(10)

      expect(active_tour.available?).to eq true
    end
  end
end
