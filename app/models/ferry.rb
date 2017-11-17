# == Schema Information
#
# Table name: ferries
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  website          :string
#  phone_number     :string
#  contact_name     :string
#  fax_number       :string
#  emergency_number :string
#  email            :string
#  rating           :decimal(, )
#  notes            :text
#

class Ferry < ApplicationRecord
  validates :title, presence: true
end
