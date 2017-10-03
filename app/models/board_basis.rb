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
end
