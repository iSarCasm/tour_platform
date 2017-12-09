# == Schema Information
#
# Table name: genders
#
#  id         :integer          not null, primary key
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model Gender do
    navigation_label 'Settings'
    weight 999
  end
end
