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
end
