# == Schema Information
#
# Table name: admin_alerts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  content    :text
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model AdminAlert do
    navigation_label 'Settings'
    weight 999
  end
end
