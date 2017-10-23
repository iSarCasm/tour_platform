# == Schema Information
#
# Table name: ferries
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ferry < ApplicationRecord
  validates :title, presence: true
end
