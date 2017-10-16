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
  has_many :tour_hotels, inverse_of: :payment_type
  has_many :hotels, inverse_of: :payment_type

  validates :payment_type, presence: true

  def title
    payment_type
  end
end
