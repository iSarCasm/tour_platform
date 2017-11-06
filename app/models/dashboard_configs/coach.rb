# == Schema Information
#
# Table name: coaches
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :text
#  phone_number     :string
#  fax_number       :string
#  website          :text
#  email            :string
#  contact_name     :string
#  emergency_number :string
#  notes            :text
#  seatplan_id      :integer
#  rating           :decimal(, )
#

RailsAdmin.config do |config|
  config.model Coach do
    defaults [:seat_prices, :seatplan, :coach_amenities]

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
      field :tour_coaches_count
      field :rating
      field :seatplan
      field :notes
    end

    update { set_template 'coaches' }
    create { set_template 'coaches' }
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
      field :coach_amenities do
        label 'Default Coach Amenities'
      end
      field :seatplan do
        label 'Default Seatplan'
      end
      field :seat_prices do
        label 'Default Seat Prices'
        render do
          bindings[:view].render(
            partial: 'table_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: ['char', 'price'],
              style: 'width: auto;',
              links_css: 'col-sm-offset-2'
            }
          )
        end
      end
      field :notes
    end

    show do
      set_template 'coaches_show'

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
      field :coach_amenities do
        label 'Default Coach Amenities'
      end
      field :seatplan  do
        label 'Default Seatplan'
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/seatplan_show',
            locals: { seatplan: bindings[:object].seatplan }
          )
        end
      end
      field :seat_prices do
        label 'Default Seat Prices'
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].seat_prices,
              table_headers: ['char', 'price'],
              methods: [:char, :price]
            }
          )
        end
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
      field :notes
    end
  end
end
