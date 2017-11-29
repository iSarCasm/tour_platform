# == Schema Information
#
# Table name: excursion_tours
#
#  id           :integer          not null, primary key
#  excursion_id :integer
#  tour_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ExcursionTour < ApplicationRecord
  belongs_to :excursion
  belongs_to :tour
end
