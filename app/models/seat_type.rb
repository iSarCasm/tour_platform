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

class SeatType < ApplicationRecord
  include DashboardSettingsSection

  validates :name, :price, :char, presence: true

  validates :char, length: { maximum: 1 }
  validates :char, :name, uniqueness: true

  def self.json
    all.each.with_object({}) do |seat, h|
      h.merge! seat.json
    end
  end

  def self.nonseat_chars
    where(is_seat: false).pluck(:char)
  end

  def json
    {
      char => {
        category: name,
        classes: classes,
        price: price,
        is_seat: is_seat,
        character: char
      }
    }
  end

  def classes
    name.downcase.gsub(/\W/,'_')
  end

  def to_s
    "#{name} Seat"
  end

  private

  def css_color
    "##{color}"
  end
end
