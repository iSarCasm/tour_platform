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

class FerryDatesAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :ferry_date
end
