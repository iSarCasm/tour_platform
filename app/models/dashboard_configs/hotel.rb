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
      field :photos
      field :notes
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
                :amount, :room_type, :adult, :adult_supp,
                :child, :child_supp, :infant, :infant_supp,
                :senior, :senior_supp
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
      field :photos
      field :notes
    end
  end
end
