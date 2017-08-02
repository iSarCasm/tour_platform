class Facility < ApplicationRecord
  has_many :hotel_facilities
  has_many :hotels, through: :hotel_facilities, dependent: :destroy

  validates :facility, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :created_at, :updated_at, :id
    end
    edit do
      field :facility
    end
  end

  def title
    facility
  end
end
