# == Schema Information
#
# Table name: hotels
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  phone_number     :string
#  fax_number       :string
#  email            :string
#  website          :string
#  contact_name     :string
#  emergency_number :string
#  rating           :decimal(, )
#

class Hotel < ApplicationRecord
  has_many :tour_hotels, dependent: :destroy, inverse_of: :hotel
  has_many :hotel_facilities, dependent: :destroy
  has_many :facilities, through: :hotel_facilities
  has_many :photos, as: :photoable, class_name: 'Photo'

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :tour_hotels, :hotel_facilities
    end
  end
end
