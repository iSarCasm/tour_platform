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

RailsAdmin.config do |config|
  config.model ExcursionTour do
    hide
  end
end
