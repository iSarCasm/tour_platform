# == Schema Information
#
# Table name: ferry_amenities
#
#  id         :integer          not null, primary key
#  ferry_id   :integer
#  amenity_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FerryAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :ferry
end
