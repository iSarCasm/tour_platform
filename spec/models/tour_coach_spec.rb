# == Schema Information
#
# Table name: tour_coaches
#
#  id             :integer          not null, primary key
#  coach_id       :integer
#  active_tour_id :integer
#  departure_date :datetime
#  arrival_date   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  driver_name    :string
#  driver_number  :string
#  notes          :text
#  seatplan_id    :integer
#

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
      tour_coach = create :tour_coach
      allow(tour_coach).to receive(:seats).and_return(40)
      bookings = create_list :coach_booking, 15, tour_coach: tour_coach
      bookings.each { |b| allow(b).to receive(:seats_amount).and_return(1) }
      tour_coach.reload

      expect(tour_coach.seats_left).to eq 25
    end
  end

  describe 'available?' do
    it 'returns if has any seats for booking' do
      tour_coach = create :tour_coach
      allow(tour_coach).to receive(:seats).and_return(40)
      bookings = create_list :coach_booking, 15, tour_coach: tour_coach
      bookings.each { |b| allow(b).to receive(:seats_amount).and_return(1) }
      tour_coach.reload

      expect(tour_coach.available?).to eq true

      bookings = create_list :coach_booking, 25, tour_coach: tour_coach
      bookings.each { |b| allow(b).to receive(:seats_amount).and_return(1) }
      tour_coach.reload

      expect(tour_coach.available?).to eq false
    end
  end
end
