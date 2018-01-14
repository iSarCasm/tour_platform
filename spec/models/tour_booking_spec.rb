# == Schema Information
#
# Table name: tour_bookings
#
#  id               :integer          not null, primary key
#  active_tour_id   :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  adult            :integer
#  child            :integer
#  infant           :integer
#  senior           :integer
#  agent_commission :decimal(, )      default(0.0)
#  cost_commission  :decimal(, )      default(0.0)
#  vat_rate         :decimal(, )      default(0.0)
#  deposit          :decimal(, )      default(0.0)
#  paid             :decimal(, )      default(0.0)
#  agent_paid       :boolean          default(FALSE)
#

require 'rails_helper'

describe TourBooking do
  describe '#title' do
    it 'shows readable represenation' do
      user = build :user, first_name: 'Jason', last_name: 'Paul'
      tour = build :tour, title: 'New tour'
      active_tour = build(:active_tour,
        tour: tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      tour_booking = build :tour_booking, active_tour: active_tour, user: user

      expect(tour_booking.title).to eq 'Jason Paul -> New tour [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#username' do
    it 'returns User name' do
      user = build_stubbed :user, first_name: 'Jason', last_name: 'Paul'
      tour_booking = build :tour_booking, user: user

      expect(tour_booking.username).to eq 'Jason Paul'
    end
  end

  describe '#tour' do
    it 'returns orignal Tour' do
      tour = build :tour
      active_tour = build :active_tour, tour: tour
      tour_booking = build :tour_booking, active_tour: active_tour

      expect(tour_booking.tour).to eq tour
    end
  end

  describe '#tour_title' do
    it 'returns name of the Tour' do
      tour = build :tour, title: 'Super Tour'
      active_tour = build :active_tour, tour: tour
      tour_booking = build :tour_booking, active_tour: active_tour
      expect(tour_booking.tour_title).to eq 'Super Tour'
    end
  end

  describe '#active_tour_title' do
    it 'returns title of an ActiveTour' do
      active_tour = build :active_tour
      allow(active_tour).to receive(:title).and_return('Super Tour')
      tour_booking = build :tour_booking, active_tour: active_tour
      expect(tour_booking.active_tour_title).to eq 'Super Tour'
    end
  end

  describe '#coach_booking' do
    it 'returns first CoachBooking' do
      tb = create :tour_booking
      cb = create :coach_booking, tour_booking: tb
      expect(tb.coach_booking).to eq cb
    end
  end

  describe '#total_cost' do
    it 'returns the end price User pays' do
      tb = create :tour_booking, adult: 1, senior: 1

      seatplan = create :seatplan, plan: '@@@@'
      tc = create :tour_coach, seatplan: seatplan
      create :seat_price, tour_coach: tc, char: '@', price: 35
      cb = create :coach_booking, tour_coach: tc, tour_booking: tb, seats: ['1_1', '1_2'].to_json

      hr = create :hotel_room, adult_sell: 30, adult_supp: 5, senior_sell: 40, senior_supp: 20
      hb = create :hotel_booking, hotel_room: hr, tour_booking: tb

      expect(tb.total_cost).to eq(35*2 + 30 + 5 + 40 + 20)
    end
  end

  describe '#remaining' do
    it 'returns how much if left to pay' do
      allow_any_instance_of(TourBooking).to receive(:total_cost).and_return(250)
      tb = build_stubbed(:tour_booking, paid: 30)

      expect(tb.remaining).to eq 220
    end
  end

  describe '#start_date' do
    it 'returns the start date of the tour' do
      active_tour = build(:active_tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      tour_booking = build :tour_booking, active_tour: active_tour

      expect(tour_booking.start_date).to eq Date.new(2017, 7, 14)
    end
  end

  describe '#end_date' do
    it 'returns the end date of the tour' do
      active_tour = build(:active_tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      tour_booking = build :tour_booking, active_tour: active_tour

      expect(tour_booking.end_date).to eq Date.new(2017, 7, 28)
    end
  end
end
