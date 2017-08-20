# == Schema Information
#
# Table name: coaches
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address       :text
#  phone         :string
#  fax           :string
#  website       :text
#  email         :string
#  contact_name  :string
#  mobile_number :string
#

class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy, inverse_of: :coach

  validates :title, presence: true

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :tour_coaches
    end
  end
end
