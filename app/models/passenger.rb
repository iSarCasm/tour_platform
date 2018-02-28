# == Schema Information
#
# Table name: passengers
#
#  id               :integer          not null, primary key
#  type             :integer
#  title            :string
#  initials         :string
#  phone            :string
#  pickup_point_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hotel_booking_id :integer
#

class Passenger < ApplicationRecord
  belongs_to :hotel_booking, inverse_of: :passengers  
  belongs_to :pickup_point, inverse_of: :passengers
end
