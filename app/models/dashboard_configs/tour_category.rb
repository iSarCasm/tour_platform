# == Schema Information
#
# Table name: tour_categories
#
#  id          :integer          not null, primary key
#  tour_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RailsAdmin.config do |config|
  config.model TourCategory do
    hide
  end
end
