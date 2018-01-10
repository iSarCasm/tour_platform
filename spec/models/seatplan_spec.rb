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
    @a = create :seat_type, char: 'a', is_seat: true
    @plan = build :seatplan, plan: "aa_aa\r\naa_aa"
  end

  context 'validations' do
    describe 'validates all rows in plan are equal length' do
      it 'different length rows' do
        plan = build :seatplan, plan: "aa_aa\naa_aaaaa"
        plan.valid?
        expect(plan.errors[:plan]).to eq ['All plan rows has to have same amount of characters.']
      end

      it 'only one row' do
        plan = build :seatplan, plan: 'aa_aa'
        plan.valid?
        expect(plan.errors[:plan]).to eq []
      end

      it 'same length rows with \r devider' do
        plan = build :seatplan, plan: "aa_aa\raa_aa"
        plan.valid?
        expect(plan.errors[:plan]).to eq []
      end

      it 'same length rows witn \n devider' do
        plan = build :seatplan, plan: "aa_aa\naa_aa"
        plan.valid?
        expect(plan.errors[:plan]).to eq []
      end

      it 'same length rows witn \r\n devider' do
        plan = build :seatplan, plan: "aa_aa\r\naa_aa"
        plan.valid?
        expect(plan.errors[:plan]).to eq []
      end
    end

    describe 'validates only existing seat types used' do
      it 'all types exist' do
        @plan.valid?
        expect(@plan.errors[:plan]).to eq []
      end

      it 'one type made up' do
        plan = build :seatplan, plan: 'aa_ax'
        plan.valid?
        expect(plan.errors[:plan]).to eq ['Incorrect seat types used: ["x"].']
      end
    end
  end

  describe '#get_seat' do
    context 'returns seat_type in a given location' do
      it do
        expect(@plan.get_seat(1, 2)).to eq @a
      end
    end
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

  describe '#total_cols' do
    it 'returns amount of cells in each row' do
      expect(@plan.total_cols).to eq 5
    end
  end

  describe '#uniq_chars' do
    it 'returns all unique characters used in plan' do
      seatplan = build :seatplan, plan: 'abbbbaaacbbbx'
      expect(seatplan.uniq_chars).to contain_exactly('a', 'b', 'c', 'x')
    end

    it 'doesnt include \n' do
      seatplan = build :seatplan, plan: "abbbbaaacb\nbb\nx"
      expect(seatplan.uniq_chars).not_to include("\n")
    end
  end

  describe '#seat_types' do
    it 'returns all seat_types used in this seatplan' do
      create :seat_type, name: 'Business', char: 'b', price: 5, color: '111', is_seat: true
      p = create :seat_type, name: 'Premium', char: 'p', price: 10, color: '000', is_seat: true
      l = create :seat_type, name: 'Lux', char: 'L', price: 2000, color: '000', is_seat: true
      seatplan = build :seatplan, plan: "pp\nLL"

      expect(seatplan.seat_types).to contain_exactly(p, l)
    end
  end

  describe '#rows' do
    it 'returns array of char rows' do
      expect(@plan.rows).to match_array ['aa_aa', 'aa_aa']
    end
  end

  describe '#only_seat_rows' do
    it 'returns arrays of char rows ignoring non-seats' do
      expect(@plan.only_seat_rows).to match_array ['aaaa', 'aaaa']
    end
  end
end
