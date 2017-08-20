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
  has_many :hotel_facilities, dependent: :destroy
  has_many :hotels, through: :hotel_facilities

  validates :facility, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      field :facility
      field :hotels
    end
    edit do
      field :facility
    end
  end

  def title
    facility
  end
end
