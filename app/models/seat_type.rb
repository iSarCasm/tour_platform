class SeatType < ApplicationRecord
  validates :name, :price, :char, presence: true

  validates :char, length: { maximum: 1 }
  validates :char, :name, uniqueness: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :id, :created_at, :updated_at
    end
  end
end
