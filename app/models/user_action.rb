# == Schema Information
#
# Table name: user_actions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  action           :text
#  subjectable_id   :integer
#  subjectable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class UserAction < ApplicationRecord
  belongs_to :user, inverse_of: :user_actions
  belongs_to :subjectable, polymorphic: true, optional: true
end
