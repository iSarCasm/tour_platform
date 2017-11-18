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

class TicketOperator < ApplicationRecord
end
