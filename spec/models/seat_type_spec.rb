# == Schema Information
#
# Table name: seat_types
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  char       :string
#  is_seat    :boolean
#  color      :string
#

require 'rails_helper'

describe SeatType do
  describe '#json' do
    it 'returns needed json for SeatPlan javascript' do
      seat = build :seat_type, name: 'Econom Class', price: 120.50, char: 'c', color: '123456', is_seat: false
      json = { 'c' => {
          category: "Econom Class",
          classes: "econom_class",
          price: "120.5",
          is_seat: false,
          character: 'c'
        }
      }.to_json
      expect(seat.json.to_json).to eq json
    end
  end

  describe '.json' do
    it 'returns needed json for SeatPlan javascript of all SeatTypes' do
      create :seat_type, name: 'Econom Class', price: 120.50, char: 'c', color: '123456', is_seat: false
      create :seat_type, name: 'Business Class', price: 12, char: 'b', color: '321123', is_seat: true
      json = { c: {
          category: "Econom Class",
          classes: "econom_class",
          price: "120.5",
          is_seat: false,
          character: 'c'
        },
        b: {
            category: "Business Class",
            classes: "business_class",
            price: "12.0",
            is_seat: true,
            character: 'b'
          }
      }.to_json
      expect(SeatType.json.to_json).to eq json
    end
  end

  describe '.nonseat_chars' do
    it 'retusn array of characters which are Non-Seats' do
      create :seat_type, char: 'c', is_seat: true
      create :seat_type, char: 'b', is_seat: true
      create :seat_type, char: 'x', is_seat: false
      create :seat_type, char: 'd', is_seat: false

      expect(SeatType.nonseat_chars).to contain_exactly('x', 'd')
    end
  end

  describe '#to_s' do
    it 'returns readable string' do
      st = build :seat_type, char: 'c', is_seat: true, name: 'Premier Class', price: 120.50
      expect(st.to_s).to eq 'Premier Class Seat'
    end
  end
end
