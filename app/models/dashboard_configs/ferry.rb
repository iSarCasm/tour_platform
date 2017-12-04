# == Schema Information
#
# Table name: ferries
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  website          :string
#  phone_number     :string
#  contact_name     :string
#  fax_number       :string
#  emergency_number :string
#  email            :string
#  rating           :decimal(, )
#

RailsAdmin.config do |config|
  config.model Ferry do
    weight 30
    defaults [:amenities]

    list do
      field :id
      field :title
      field :description
      field :address
      field :phone_number
      field :fax_number
      field :website
      field :email
      field :contact_name
      field :emergency_number
      field :rating
    end

    create { set_template 'ferry' }
    update { set_template 'ferry' }

    edit do
      field :title
      field :description do
        html_attributes rows: 18, cols: 53
      end
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
      field :website
      field :email
      field :contact_name
      field :emergency_number
      field :rating
      field :amenities do
        label 'Default Amenities'
      end
      field :photos do
        render do
          bindings[:view].render(
            partial: 'list_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: ['Photo']
            }
          )
        end
      end
    end

    show do
      set_template 'ferry_show'

      field :id
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
      field :website
      field :email
      field :contact_name
      field :emergency_number
      field :rating
      field :amenities do
        label 'Default Amenities'
      end
      field :photos do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/list_show',
            locals: {
              objects: bindings[:object].photos,
              methods: [:photo]
            }
          )
        end
      end
    end
  end
end
