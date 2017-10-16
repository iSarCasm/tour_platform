# == Schema Information
#
# Table name: hotel_facilities
#
#  id          :integer          not null, primary key
#  hotel_id    :integer
#  facility_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RailsAdmin.config do |config|
  config.model HotelFacility do
    hide
  end
end
