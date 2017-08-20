# == Schema Information
#
# Table name: board_bases
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoardBasis < ApplicationRecord
  has_many :tour_hotels, inverse_of: :board_basis
  validates :title, presence: true

  rails_admin do
    navigation_label 'Settings'
    weight 999
    list do
      exclude_fields :created_at, :updated_at, :id
    end
    edit do
      field :title
    end
  end
end
