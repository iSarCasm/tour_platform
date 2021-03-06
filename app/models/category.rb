# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :tour_categories, dependent: :destroy
  has_many :tours, through: :tour_categories

  validates :name, presence: true
end
