# == Schema Information
#
# Table name: excursions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Excursion < ApplicationRecord
  has_many :excursion_tours, dependent: :destroy
  has_many :tours, through: :excursion_tours
  has_many :tour_excursions, dependent: :destroy
end
