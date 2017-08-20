# == Schema Information
#
# Table name: tour_bookings
#
#  id             :integer          not null, primary key
#  active_tour_id :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  adult          :integer
#  child          :integer
#  infant         :integer
#  senior         :integer
#

require 'rails_helper'

describe TourBooking do
  describe '#title' do
    it 'shows readable represenation' do
      user = build :user, name: 'Jason'
      tour = build :tour, title: 'New tour'
      active_tour = build(:active_tour,
        tour: tour,
        start_date: Date.new(2017, 7, 14),
        end_date: Date.new(2017, 7, 28)
      )
      tour_booking = build :tour_booking, active_tour: active_tour, user: user

      expect(tour_booking.title).to eq 'Jason -> New tour [14 Jul 2017 - 28 Jul 2017]'
    end
  end

  describe '#username' do
    it 'returns User name' do
      user = build :user, name: 'Jason'
      tour_booking = build :tour_booking, user: user

      expect(tour_booking.username).to eq 'Jason'
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
end
