# == Schema Information
#
# Table name: genders
#
#  id         :integer          not null, primary key
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gender < ApplicationRecord
  has_many :users, inverse_of: :gender

  def title
    gender
  end
end
