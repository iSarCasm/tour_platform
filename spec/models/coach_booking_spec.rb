require 'rails_helper'

describe CoachBooking do
  describe '#title' do
    it 'shows readable represenation' do
      user = build :user, name: 'Jason'
      tour_booking = build :tour_booking, user: user

      coach = build :coach, title: 'Reliable Transport'
      tour_coach = build(:tour_coach,
        coach: coach,
        departure_date: Date.new(2017, 7, 14),
        arrival_date: Date.new(2017, 7, 28)
      )
      coach_booking = build :coach_booking, tour_booking: tour_booking, tour_coach: tour_coach

      expect(coach_booking.title).to eq 'Jason -> Reliable Transport [14 Jul 2017 - 28 Jul 2017]'
    end
  end

end
