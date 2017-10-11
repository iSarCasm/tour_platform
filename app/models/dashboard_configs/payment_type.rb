# == Schema Information
#
# Table name: payment_types
#
#  id           :integer          not null, primary key
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

RailsAdmin.config do |config|
  config.model PaymentType do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :payment_type
      field :tour_hotels do
        eager_load true
      end
    end

    edit do
      field :payment_type
    end
  end
end
