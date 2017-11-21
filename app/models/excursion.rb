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
  has_many :tour_excursions
end
