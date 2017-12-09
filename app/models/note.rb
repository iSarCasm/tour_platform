# == Schema Information
#
# Table name: notes
#
#  id            :integer          not null, primary key
#  noteable_id   :integer
#  noteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  message       :text
#  user_id       :integer
#

class Note < ApplicationRecord
  belongs_to :user, inverse_of: :notes
  belongs_to :noteable, polymorphic: true

  def user_name
    "#{user.first_name} #{user.last_name}"
  end
end
