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
      field :id
      field :title
      field :tour_hotels do
        eager_load true
      end
    end
    
    edit do
      field :title
    end
  end
end
