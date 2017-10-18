# == Schema Information
#
# Table name: tour_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TourType < ApplicationRecord
  has_many :tours, inverse_of: :tour_type

  validates :name, presence: true
end
