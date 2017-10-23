# == Schema Information
#
# Table name: ferries
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RailsAdmin.config do |config|
  config.model Ferry do
    weight 30
  end
end
