# == Schema Information
#
# Table name: notes
#
#  id            :integer          not null, primary key
#  name          :string
#  noteable_id   :integer
#  noteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :user, inverse_of: :notes
  belongs_to :noteable, polymorphic: true
end
