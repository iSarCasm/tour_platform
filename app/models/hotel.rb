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
#  board_basis_id   :integer
#  payment_type_id  :integer
#

class Hotel < ApplicationRecord
  has_many :tour_hotels, dependent: :destroy, inverse_of: :hotel
  has_many :hotel_facilities, dependent: :destroy
  has_many :facilities, through: :hotel_facilities
  has_many :photos, as: :photoable, class_name: 'Photo', inverse_of: :photoable
  has_many :notes, as: :noteable

  # Defaults
  has_many :hotel_rooms, dependent: :destroy, inverse_of: :hotel
  belongs_to :board_basis, inverse_of: :hotels, optional: true
  belongs_to :payment_type, inverse_of: :hotels, optional: true

  accepts_nested_attributes_for :hotel_rooms, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
end
