# == Schema Information
#
# Table name: ferry_dates
#
#  id         :integer          not null, primary key
#  ferry_id   :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model FerryDate do
    parent Ferry
  end
end
