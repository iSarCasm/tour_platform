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
#

RailsAdmin.config do |config|
  config.model TicketOperator do
    weight 50

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

    show do
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
  end
end
