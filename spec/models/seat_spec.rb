require 'rails_helper'

describe Seat do
  describe '.initialize' do
    context 'returns Seat object from Seatplan and its Seat position' do
      before do
        @c = create :seat_type, char: 'c'
        @b = create :seat_type, char: 'b'
        @d = create :seat_type, char: 'd'
        create :seat_type, char: 'w', is_seat: false
        @seatplan = build :seatplan, plan: "cc_cc\nbb_bb\ndd_dd\ncc_cc\nww_ww\ncc_cc"
      end

      it do
        seat = Seat.new(seatplan: @seatplan, row_col: '1_2')
        expect(seat.number).to eq 2
        expect(seat.seat_type).to eq @c
      end

      it do
        seat = Seat.new(seatplan: @seatplan, row_col: '2_2')
        expect(seat.number).to eq 6
        expect(seat.seat_type).to eq @b
      end

      it do
        seat = Seat.new(seatplan: @seatplan, row_col: '3_4')
        expect(seat.number).to eq 11
        expect(seat.seat_type).to eq @d
      end

      it do
        seat = Seat.new(seatplan: @seatplan, row_col: '4_1')
        expect(seat.number).to eq 13
        expect(seat.seat_type).to eq @c
      end

      it do
        seat = Seat.new(seatplan: @seatplan, row_col: '6_5')
        expect(seat.number).to eq 20
        expect(seat.seat_type).to eq @c
      end
    end
  end
end
