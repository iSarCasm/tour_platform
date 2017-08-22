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
  validate :all_rows_equal_length
  validate :only_existing_seat_types_used

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
      field :title
      field :description
      field :plan do
        partial "seatplan_plan_edit"
      end
    end
    show do
      field :id
      field :title
      field :description
      field :total_seats
      field :total_rows
      field :plan do
        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          bindings[:view].render(
            partial: "rails_admin/seatplan_plan_show",
            locals: { seatplan: bindings[:object] }
          )
        end
      end
      field :created_at
      field :updated_at
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
      (c == "\n" || c == "\r") ? sum + 1 : sum
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

  def all_rows_equal_length
    rows = plan.split(/\r\n|\r|\n/)
    error = rows.any? do |row|
      row.size != rows[0].size
    end
    if error
      errors.add :plan, 'All plan rows has to have same amount of characters.'
    end
  end

  def only_existing_seat_types_used
    incorrect = []
    error = uniq_chars.each do |char|
      type = SeatType.find_by(char: char)
      incorrect << char unless type
    end
    unless incorrect.empty?
      errors.add :plan, "Incorrect seat types used: #{incorrect.to_s}."
    end
  end

end
