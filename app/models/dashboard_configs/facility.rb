# == Schema Information
#
# Table name: facilities
#
#  id         :integer          not null, primary key
#  facility   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model Facility do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :facility
      field :hotels do
        eager_load true
      end
    end

    edit do
      field :facility
    end
  end
end
