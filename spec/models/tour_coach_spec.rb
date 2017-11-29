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
#  rate           :decimal(, )
#  vehicle_reg    :string
#  pickup_list_id :integer
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

  describe '#coach_bookings_count' do
    it 'returns count of associated coach_bookings' do
      tour_coach = create :tour_coach
      create_list :coach_booking, 3, tour_coach: tour_coach

      expect(tour_coach.coach_bookings_count).to eq 3
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
      create :pickup_list, tour_coach: tour_coach
      allow(tour_coach).to receive(:seats).and_return(4)
      bookings = create_list :coach_booking, 1, tour_coach: tour_coach
      bookings.each { |b| allow(b).to receive(:seats_amount).and_return(1) }
      tour_coach.reload

      expect(tour_coach.available?).to eq true

      bookings = create_list :coach_booking, 3, tour_coach: tour_coach
      bookings.each { |b| allow(b).to receive(:seats_amount).and_return(1) }
      tour_coach.reload

      expect(tour_coach.available?).to eq false
    end
  end

  describe '#seat_types' do
    it 'returns all associated' do
      create :seat_type, name: 'Lux', char: 'L', price: 2000, color: '000', is_seat: true
      p = create :seat_type, name: 'Premium', char: 'p', price: 10, color: '000', is_seat: true
      b = create :seat_type, name: 'Business', char: 'b', price: 5, color: '111', is_seat: true
      seatplan = create :seatplan, plan: "pppp\rbbbb"
      coach = create :tour_coach, seatplan: seatplan

      expect(coach.seat_types).to contain_exactly(p, b)
    end
  end

  describe '#json_seat_types' do
    before do
      create :seat_type, name: 'Premium', char: 'p', price: 10, color: '000', is_seat: true
      create :seat_type, name: 'Business', char: 'b', price: 5, color: '111', is_seat: true
      create :seat_type, name: 'Lux', char: 'L', price: 2000, color: '000', is_seat: true
      @seatplan = create :seatplan, plan: "pppp\nbbbb"
      @coach = create :tour_coach, seatplan: @seatplan
    end

    it 'returns all seat types used in tour coach' do
      json = {
        p: {
          category: 'Premium',
          classes: 'premium',
          price: '10.0',
          is_seat: true,
          character: 'p'
        },
        b: {
          category: 'Business',
          classes: 'business',
          price: '5.0',
          is_seat: true,
          character: 'b'
        }
      }.to_json
      expect(@coach.json_seat_types.to_json).to eq json
    end

    it 'returns tour coach seat types with modified prices with associated SeatPrices' do
      create :seat_price, char: 'p', price: 300, tour_coach: @coach

      json = {
        p: {
          category: 'Premium',
          classes: 'premium',
          price: '300.0',
          is_seat: true,
          character: 'p'
        },
        b: {
          category: 'Business',
          classes: 'business',
          price: '5.0',
          is_seat: true,
          character: 'b'
        }
      }.to_json
      expect(@coach.json_seat_types.to_json).to eq json
    end
  end

  describe '#coach_title' do
    it "returns the coach's #title" do
      coach = build :coach
      tour_coach = build :tour_coach, coach: coach
      allow(coach).to receive(:title).and_return('What a unique title')
      expect(tour_coach.coach_title).to eq coach.title
    end
  end

  describe '#pickup_points' do
    it 'returns all pickup points for this tour coach' do
      tour_coach = create :tour_coach
      list = create :pickup_list, tour_coach: tour_coach
      a = create :pickup_point, pickup_list: list
      b = create :pickup_point, pickup_list: list
      c = create :pickup_point, pickup_list: list
      expect(tour_coach.pickup_points).to contain_exactly(a, b, c)
    end
  end

  describe '#seat_price' do
    it 'returns the price of a given seat' do
      create :seat_type, char: '$', price: 20
      seatplan = create :seatplan, plan: "@\n$"
      tc = create :tour_coach, seatplan: seatplan
      create :seat_price, tour_coach: tc, char: '@', price: 35

      expect(tc.seat_price('1_1')).to eq(35)
      expect(tc.seat_price('2_1')).to eq(20)
    end
  end
end
