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

RailsAdmin.config do |config|
  config.model UserAction do
    hide
  end
end
