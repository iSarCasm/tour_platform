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

class AdminAlert < ApplicationRecord
  include DashboardSettingsSection
  
  belongs_to :user, inverse_of: :admin_alerts
  validates :title, :user, presence: true
end
