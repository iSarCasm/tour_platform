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

class Seatplan < ApplicationRecord
  has_many :tour_coaches, inverse_of: :seatplan

  validates :title, :plan, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      field :title
      field :description
      field :total_seats
      field :total_rows
    end
    edit do
      exclude_fields :tour_coaches
    end
  end

  def total_seats
    total = 0
    plan.each_char do |c|
      seat_type =  SeatType.find_by(char: c)
      total += 1 if seat_type && seat_type.is_seat
    end
    total
  end

  def total_rows
    plan.split('').reduce(1) do |sum, c|
      c == "\n" ? sum + 1 : sum
    end
  end

  def total_cells
    plan.gsub("\n", '').length
  end
end
