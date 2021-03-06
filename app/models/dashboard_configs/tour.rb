# == Schema Information
#
# Table name: tours
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  tour_type_id          :integer
#  country_id            :integer
#  itinerary             :text
#  tour_memo             :text
#  other_costs           :decimal(, )
#  self_drive            :boolean
#  allow_deposits        :boolean
#  allow_external_agents :boolean
#  insurance_allowed     :boolean
#

RailsAdmin.config do |config|
  config.model Tour do
    defaults [:allow_deposits, :other_costs, :self_drive, :allow_external_agents, :insurance_allowed]

    create { set_template 'tour' }
    update { set_template 'tour' }

    edit do
      field :title
      field :description do
        html_attributes rows: 18, cols: 53
      end
      field :tour_type
      field :country
      field :categories
      field :allow_deposits do
        label 'Default allow deposits'
      end
      field :other_costs do
        label 'Default other costs'
      end
      field :self_drive do
        label 'Default self drive'
      end
      field :allow_external_agents do
        label 'Default allow external agents'
      end
      field :insurance_allowed do
        label 'Default insurance allowed'
      end
      field :excursions
      field :itinerary
      field :tour_memo
    end

    list do
      field :id
      field :title
      field :description
      field :tour_type
      field :country
      field :categories
      field :allow_deposits do
        label 'Default allow deposits'
      end
      field :other_costs do
        label 'Default other costs'
      end
      field :self_drive do
        label 'Default self drive'
      end
      field :allow_external_agents do
        label 'Default allow external agents'
      end
      field :insurance_allowed do
        label 'Default insurance allowed'
      end
      field :excursions
      field :itinerary
      field :tour_memo
      field :active_tours do
        eager_load true
      end
    end

    show do
      set_template 'tour_show'
      field :title
      field :description
      field :tour_type
      field :country
      field :categories
      field :allow_deposits do
        label 'Default allow deposits'
      end
      field :other_costs do
        label 'Default other costs'
      end
      field :self_drive do
        label 'Default self drive'
      end
      field :allow_external_agents
      field :insurance_allowed
      field :excursions
      field :itinerary
      field :tour_memo
      field :active_tours do
        eager_load true
      end
    end
  end
end
