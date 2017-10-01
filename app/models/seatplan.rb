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
  include DashboardSettingsSection

  has_many :tour_coaches, inverse_of: :seatplan

  validates :title, :plan, presence: true
  validate :all_rows_equal_length
  validate :only_existing_seat_types_used

  rails_admin do
    list do
      field :title
      field :description
      field :total_seats
      field :total_rows
    end
    edit do
      field :title
      field :description
      field :plan do
        partial 'seatplan_plan_edit'
      end
    end
    show do
      field :id
      field :title
      field :description
      field :total_seats
      field :total_rows
      field :plan do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/seatplan_plan_show',
            locals: { seatplan: bindings[:object] }
          )
        end
      end
      field :created_at
      field :updated_at
    end
  end

  def get_seat(row, col)
    char = rows[row - 1][col - 1]
    SeatType.find_by(char: char)
  end

  def total_seats
    total = 0
    plan.each_char do |c|
      seat_type =  SeatType.find_by(char: c)
      total += 1 if seat_type && seat_type.is_seat
    end
    total
  end

  def total_cols
    total_cells / total_rows
  end

  def total_rows
    plan.split('').reduce(1) do |sum, c|
      ["\n", "\r"].include?(c) ? sum + 1 : sum
    end
  end

  def total_cells
    plan.gsub(/\r\n|\r|\n/, '').length
  end

  def uniq_chars
    plan.gsub(/\r\n|\r|\n/, '').chars.to_a.uniq
  end

  def seat_types
    SeatType.where(char: uniq_chars)
  end

  def seat_types_json
    seat_types.each.with_object({}) do |seat, h|
      h.merge! seat.json
    end
  end

  def rows
    plan.split(/\r\n|\r|\n/)
  end

  def only_seat_rows
    non_seats = SeatType.nonseat_chars
    rows.map { |r| r.gsub(/#{non_seats.join('|')}/, '') }
  end

  def all_rows_equal_length
    error = rows.any? do |row|
      row.size != rows[0].size
    end
    errors.add :plan, 'All plan rows has to have same amount of characters.' if error
  end

  def only_existing_seat_types_used
    incorrect = []
    uniq_chars.each do |char|
      type = SeatType.find_by(char: char)
      incorrect << char unless type
    end
    errors.add :plan, "Incorrect seat types used: #{incorrect}." unless incorrect.empty?
  end
end
