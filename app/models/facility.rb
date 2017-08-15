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
