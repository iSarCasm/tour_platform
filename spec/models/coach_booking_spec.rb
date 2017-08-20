# == Schema Information
#
# Table name: coach_bookings
#
#  id              :integer          not null, primary key
#  tour_coach_id   :integer
#  tour_booking_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  seats           :json
#

require 'rails_helper'

describe CoachBooking do
  describe 'create validations' do
    it 'validates available seats' do
      tour_coach = create :tour_coach
      allow(tour_coach).to receive(:seats_left).and_return(1) # coach has only 1 seat
      booking = build :coach_booking, tour_coach: tour_coach
      allow(booking).to receive(:seats_amount).and_return(2)  # we try to book 2 seats

      expect(booking.save).to eq false
    end
  end

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

  describe '#seats_amount' do
    it 'returns amount of seats booked' do
      booking = build :coach_booking, seats: ['7_1', '7_2', '7_3'].to_json
      expect(booking.seats_amount).to eq 3
    end
  end
end
