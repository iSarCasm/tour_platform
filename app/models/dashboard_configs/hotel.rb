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
#  notes            :text
#  payment_type_id  :integer
#

RailsAdmin.config do |config|
  config.model Hotel do
    defaults [:board_basis, :payment_type, :hotel_rooms]

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
      field :board_basis
      field :payment_type
      field :notes
    end

    update { set_template 'hotels' }
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
      field :email
      field :website
      field :contact_name
      field :emergency_number
      field :rating
      field :facilities
      field :hotel_rooms do
        label 'Default hotel rooms'
        render do
          bindings[:view].render(
            partial: 'table_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: [
                'Amount', 'Room Type',
                'Adult Buy', 'Adult Sell', 'Adult supp',
                'Senior Buy', 'Senior Sell', 'Senior supp',
                'Child Buy', 'Child Sell',
                'Infant Buy', 'Infant Sell'
              ]
            }
          )
        end
      end
      field :board_basis do
        label 'Default board basis'
      end
      field :payment_type do
        label 'Default payment type'
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
      field :notes do
        html_attributes rows: 10, cols: 100
      end
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
      field :hotel_rooms do
        label 'Default hotel rooms'
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].hotel_rooms,
              table_headers: [
                'Amount', 'Room Type',
                'Adult Buy', 'Adult Sell', 'Adult supp',
                'Senior Buy', 'Senior Sell', 'Senior supp',
                'Child Buy', 'Child Sell',
                'Infant Buy', 'Infant Sell'
              ],
              methods: [
                :amount, :room_type,
                :adult_buy, :adult_sell, :adult_supp,
                :senior_buy, :senior_sell, :senior_supp, :child_buy, :child_sell,
                :infant_buy, :infant_sell
              ]
            }
          )
        end
      end
      field :board_basis do
        label 'Default board basis'
      end
      field :payment_type do
        label 'Default payment type'
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
      field :notes do
        html_attributes rows: 20, cols: 50
      end
    end
  end
end
