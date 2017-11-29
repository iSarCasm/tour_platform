# == Schema Information
#
# Table name: ticket_operators
#
#  id           :integer          not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  address      :text
#  description  :text
#  website      :string
#  phone_number :string
#  buyer_name   :string
#  fax_number   :string
#  buyer_number :string
#  email        :string
#  rating       :decimal(, )
#  stock        :integer
#  adult_buy    :decimal(, )
#  adult_sell   :decimal(, )
#  senior_buy   :decimal(, )
#  senior_sell  :decimal(, )
#  child_buy    :decimal(, )
#  child_sell   :decimal(, )
#  infant_buy   :decimal(, )
#  infant_sell  :decimal(, )
#

RailsAdmin.config do |config|
  config.model TicketOperator do
    weight 50

    defaults [
      :stock,
      :adult_buy,
      :adult_sell,
      :senior_buy,
      :senior_sell,
      :infant_buy,
      :infant_sell,
      :child_buy,
      :child_sell
    ]

    create { set_template 'ticket_operator' }
    update { set_template 'ticket_operator' }

    list do
      field :title
      field :description
      field :address
      field :website
      field :phone_number
      field :fax_number
      field :email
      field :buyer_name
      field :buyer_number
      field :rating
    end

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
      field :website
      field :phone_number
      field :fax_number
      field :email
      field :buyer_name
      field :buyer_number
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
      field :stock
      field :adult_buy
      field :adult_sell
      field :senior_buy
      field :senior_sell
      field :infant_buy
      field :infant_sell
      field :child_buy
      field :child_sell
    end

    show do
      set_template 'ticket_operator_show'
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
      field :website
      field :phone_number
      field :fax_number
      field :email
      field :buyer_name
      field :buyer_number
      field :rating
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
      field :stock
      field :adult_buy
      field :adult_sell
      field :senior_buy
      field :senior_sell
      field :infant_buy
      field :infant_sell
      field :child_buy
      field :child_sell
    end
  end
end
