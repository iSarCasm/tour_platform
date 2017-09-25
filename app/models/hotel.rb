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
      field :id
      field :title
      field :description
      field :address
      field :phone_number
      field :fax_number
      field :email
      field :website
      field :contact_name
      field :emergency_number
      field :rating
      field :facilities do
        eager_load true
      end
    end

    edit do
      field :title
      field :description
      field :address do
        render do
          bindings[:view].render(
            partial: 'google_map_address_edit',
            locals: {
              field: self,
              form: bindings[:form],
              google_api_key: Rails.application.secrets.google_api_key
            }
          )
        end
      end
      field :phone_number
      field :fax_number
      field :email
      field :website
      field :contact_name
      field :emergency_number
      field :rating
      field :facilities
      field :photos
    end
  end
end
