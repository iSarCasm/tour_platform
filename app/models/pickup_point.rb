# == Schema Information
#
# Table name: pickup_points
#
#  id             :integer          not null, primary key
#  pickup_list_id :integer
#  address        :string
#  longitude      :decimal(, )
#  latitude       :decimal(, )
#  time_to_hub    :string
#  time_from_hub  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PickupPoint < ApplicationRecord
  include DashboardSettingsSection

  belongs_to :pickup_list, inverse_of: :pickup_points
  has_many :coach_bookings, inverse_of: :pickup_point

  validates :address, :latitude, :longitude, presence: true

  rails_admin do
    edit do
      field :pickup_list
      field :address do
        render do
          bindings[:view].render(
            partial: 'google_map_location_edit',
            locals: {
              field: self,
              form: bindings[:form],
              google_api_key: Rails.application.secrets.google_api_key
            }
          )
        end
      end
      field :latitude
      field :longitude
      field :time_from_hub
      field :time_to_hub
    end

    show do
      field :pickup_list
      field :address
      field :latitude
      field :longitude do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/google_map_location_show',
            locals: {
              object: bindings[:object],
              value: bindings[:object].longitude,
              google_api_key: Rails.application.secrets.google_api_key
            }
          )
        end
      end
      field :time_from_hub
      field :time_to_hub
    end
  end
end
