class SeatType < ApplicationRecord
  validates :name, :price, :char, presence: true

  validates :char, length: { maximum: 1 }
  validates :char, :name, uniqueness: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    edit do
      field :name
      field :price
      field :char
      field :is_seat
      field :color, :color
    end
    list do
      exclude_fields :id, :created_at, :updated_at
    end
  end

  def self.json
    all.each.with_object({}) do |seat, h|
      h.merge! seat.json
    end
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

  private

  def css_color
    "##{color}"
  end
end
