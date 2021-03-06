# == Schema Information
#
# Table name: users
#
#  id                                :integer          not null, primary key
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  email                             :string           default(""), not null
#  encrypted_password                :string           default(""), not null
#  reset_password_token              :string
#  reset_password_sent_at            :datetime
#  remember_created_at               :datetime
#  sign_in_count                     :integer          default(0), not null
#  current_sign_in_at                :datetime
#  last_sign_in_at                   :datetime
#  current_sign_in_ip                :inet
#  last_sign_in_ip                   :inet
#  base_role                         :integer          default("customer")
#  role_id                           :integer
#  title                             :string
#  address                           :string
#  postcode                          :string
#  passport_name                     :string
#  passport_no                       :string
#  date_of_birth                     :date
#  phone_mobile                      :string
#  phone_landline                    :string
#  phone_evening                     :string
#  kin_name                          :string
#  kin_phone                         :string
#  travel_club                       :boolean
#  member_no                         :string
#  first_name                        :string
#  last_name                         :string
#  marketing_email                   :boolean
#  marketing_sms                     :boolean
#  marketing_phone                   :boolean
#  marketing_postal                  :boolean
#  passport_expiry                   :date
#  gender_id                         :integer
#  may_expand_more_with_full_contact :boolean
#  client_unsuitable_for_travel      :boolean
#

require 'rails_helper'

describe User do
  def create_tour_booking_of_cost(cost, user)
    tb = create :tour_booking, adult: 1, user: user
    seatplan = create :seatplan, plan: '@'
    tc = create :tour_coach, seatplan: seatplan
    create :seat_price, tour_coach: tc, char: '@', price: cost/2
    create :coach_booking, tour_coach: tc, tour_booking: tb, seats: ['1_1'].to_json
    hr = create :hotel_room, adult_sell: cost/2, adult_supp: 0
    create :hotel_booking, hotel_room: hr, tour_booking: tb
  end

  describe '#name' do
    it 'concatenated #first_name and #last_name' do
      user = create :user, first_name: 'Jake', last_name: 'Paul'

      expect(user.name).to eq 'Jake Paul'
    end
  end

  describe '#full_name' do
    it 'returns name with title' do
      user = create :user, first_name: 'Jake', last_name: 'Paul', title: 'Mr'

      expect(user.full_name).to eq 'Mr Jake Paul'
    end
  end

  describe '#total_spent' do
    it 'returns all spendings of User' do
      user = create :user
      create_tour_booking_of_cost(100, user)
      create_tour_booking_of_cost(50, user)
      expect(user.total_spent).to eq 150
    end
  end

  describe '#last_travelled' do
    it 'returns the Users tour booking with latest end date' do
      user = create :user
      create :tour_booking, active_tour: create(:active_tour, end_date: Date.new(2017, 7, 28)), user: user
      b2 = create :tour_booking, active_tour: create(:active_tour, end_date: Date.new(2017, 8, 19)), user: user
      create :tour_booking, active_tour: create(:active_tour, end_date: Date.new(2017, 3, 14)), user: user

      expect(user.last_travelled).to eq b2
    end
  end
end
