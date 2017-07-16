require 'rails_helper'

describe ActiveTour do
  describe '#title' do
    it 'shows readable represenation' do
      tour = create :tour, title: 'New tour'
      active_tour = create(:active_tour,
        tour: tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      expect(active_tour.title).to eq 'New tour [14 Jul 2017 - 28 Jul 2017]'
    end
  end
end
