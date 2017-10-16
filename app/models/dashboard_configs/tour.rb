# == Schema Information
#
# Table name: tours
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

RailsAdmin.config do |config|
  config.model Tour do
    edit do
      field :title
      field :description
      field :tour_type
      field :active_tours do
        eager_load true
      end
    end

    list do
      field :id
      field :title
      field :description
      field :tour_type
      field :active_tours do
        eager_load true
      end
    end
  end
end
