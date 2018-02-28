# == Schema Information
#
# Table name: passengers
#
#  id              :integer          not null, primary key
#  type            :integer
#  title           :string
#  initials        :string
#  phone           :string
#  pickup_point_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Passenger < ApplicationRecord
  belongs_to :pickup_point
end
