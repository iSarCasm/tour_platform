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
#  pickup_point_id :integer
#

require 'rails_helper'

describe CoachBooking do
  describe 'create validations' do
    it 'validates available seats' do
      tour_coach = build :tour_coach
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

  describe '#seatplan' do
    it 'return TourCoach Seatplan' do
      splan = build :seatplan
      t_coach = build :tour_coach, seatplan: splan
      booking = build :coach_booking, tour_coach: t_coach
      expect(booking.seatplan).to eq splan
    end
  end

  describe '#seat_objects' do
    it 'retuns an array of Seats' do
      a = create :seat_type, char: 'a'
      b = create :seat_type, char: 'b'
      splan = build :seatplan, plan: "aa_aa\nbb_bb"
      t_coach = build :tour_coach, seatplan: splan
      booking = build :coach_booking, tour_coach: t_coach, seats: ['1_2', '2_4']

      seat_1 = Seat.new
      seat_1.number = 2
      seat_1.seat_type = a
      seat_1.price = a.price
      seat_2 = Seat.new
      seat_2.number = 7
      seat_2.seat_type = b
      seat_2.price = b.price
      expect(booking.seat_objects).to include(seat_1)
      expect(booking.seat_objects).to include(seat_2)
    end
  end

  describe '#total_cost' do
    it 'returns sum cost' do
      tb = build :tour_booking, adult: 1, senior: 1
      seatplan = build :seatplan, plan: '@@@@'
      tc = build :tour_coach, seatplan: seatplan
      create :seat_price, tour_coach: tc, char: '@', price: 35
      cb = build :coach_booking, tour_coach: tc, tour_booking: tb, seats: ['1_1', '1_2'].to_json

      expect(cb.total_cost).to eq(35 + 35)
    end
  end
end
