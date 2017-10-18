# == Schema Information
#
# Table name: tours
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  tour_type_id    :integer
#  country_id      :integer
#  excursions      :text
#  itinerary       :text
#  important_notes :text
#  tour_memo       :text
#

RailsAdmin.config do |config|
  config.model Tour do
    edit do
      field :title
      field :description
      field :tour_type
      field :country
      field :categories
      field :excursions
      field :itinerary
      field :important_notes
      field :tour_memo
      field :active_tours do
        eager_load true
      end
    end

    list do
      field :id
      field :title
      field :description
      field :tour_type
      field :country
      field :categories
      field :excursions
      field :itinerary
      field :important_notes
      field :tour_memo
      field :active_tours do
        eager_load true
      end
    end
  end
end
