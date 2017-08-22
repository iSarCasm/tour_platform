# == Schema Information
#
# Table name: seatplans
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  plan        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Seatplan do
  before :each do
    create :seat_type, char: 'a', is_seat: true
    create :seat_type, char: '_', is_seat: false
    @plan = build :seatplan, plan: "aa_aa\naa_aa"
  end

  describe '#total_seats' do
    it 'returns amount of seats for customers' do
      expect(@plan.total_seats).to eq 8
    end
  end

  describe '#total_cells' do
    it 'returns amount of cells inside a seatplan' do
      expect(@plan.total_cells).to eq 10
    end
  end

  describe '#total_rows' do
    it 'returns amount of rows for seatplan' do
      expect(@plan.total_rows).to eq 2
    end
  end

  describe '#uniq_chars' do
    it 'returns all unique characters used in plan' do
      seatplan = build :seatplan, plan: "abbbbaaacbbbx"
      expect(seatplan.uniq_chars).to contain_exactly('a', 'b', 'c', 'x')
    end

    it 'doesnt include \n' do
      seatplan = build :seatplan, plan: "abbbbaaacb\nbb\nx"
      expect(seatplan.uniq_chars).not_to include("\n")
    end
  end

  describe '#seat_types' do
    it 'returns all seat_types used in this seatplan' do
      p = create :seat_type, name: 'Premium', char: 'p', price: 10, color: '000', is_seat: true
      b = create :seat_type, name: 'Business', char: 'b', price: 5, color: '111', is_seat: true
      l = create :seat_type, name: 'Lux', char: 'L', price: 2000, color: '000', is_seat: true
      seatplan = create :seatplan, plan: "pp\rLL"

      expect(seatplan.seat_types).to contain_exactly(p, l)
    end
  end
end
