# == Schema Information
#
# Table name: ferry_dates_amenities
#
#  id            :integer          not null, primary key
#  ferry_date_id :integer
#  amenity_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

RailsAdmin.config do |config|
  config.model FerryDatesAmenity do
    hide
  end
end
