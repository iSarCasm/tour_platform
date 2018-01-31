# == Schema Information
#
# Table name: excursions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RailsAdmin.config do |config|
  config.model Excursion do
    weight 50

    edit do
      field :title
      field :description
    end
  end
end
