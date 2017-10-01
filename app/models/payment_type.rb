# == Schema Information
#
# Table name: payment_types
#
#  id           :integer          not null, primary key
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PaymentType < ApplicationRecord
  include DashboardSettingsSection
  
  has_many :tour_hotels, inverse_of: :payment_type

  validates :payment_type, presence: true

  rails_admin do
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

  def title
    payment_type
  end
end
