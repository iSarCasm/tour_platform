RailsAdmin.config do |config|
  config.model PickupPoint do
    navigation_label 'Settings'
    weight 999
    
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
