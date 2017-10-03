RailsAdmin.config do |config|
  config.model Hotel do
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

    show do
      field :title
      field :description
      field :address do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/google_map_address_show',
            locals: {
              value: bindings[:object].address,
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
