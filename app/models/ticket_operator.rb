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

class TicketOperator < ApplicationRecord
  has_many :photos, as: :photoable, class_name: 'Photo'
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
end
