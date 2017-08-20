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

class HotelFacility < ApplicationRecord
  belongs_to :hotel
  belongs_to :facility

  rails_admin do
    hide
  end
end
