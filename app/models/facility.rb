# == Schema Information
#
# Table name: facilities
#
#  id         :integer          not null, primary key
#  facility   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Facility < ApplicationRecord
  include DashboardSettingsSection

  has_many :hotel_facilities, dependent: :destroy
  has_many :hotels, through: :hotel_facilities

  validates :facility, presence: true

  def title
    facility
  end
end
