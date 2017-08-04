class PaymentType < ApplicationRecord
  has_many :tour_hotels, inverse_of: :payment_type
  
  validates :payment_type, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :created_at, :updated_at, :id
    end
    edit do
      field :payment_type
    end
  end

  def title
    payment_type
  end
end
