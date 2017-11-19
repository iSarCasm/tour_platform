# == Schema Information
#
# Table name: active_tours
#
#  id                    :integer          not null, primary key
#  tour_id               :integer
#  start_date            :date
#  end_date              :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  allow_deposits        :boolean
#  other_costs           :decimal(, )
#  self_drive            :boolean
#  allow_external_agents :boolean
#  insurance_allowed     :boolean
#

RailsAdmin.config do |config|
  config.model ActiveTour do
    parent Tour

    list do
      field :id
      field :tour
      field :start_date
      field :end_date
      field :tour_bookings do
        eager_load true
      end
      field :tour_hotels do
        eager_load true
      end
      field :tour_coaches do
        eager_load true
      end
      field :allow_deposits
      field :other_costs
      field :self_drive
    end

    create { set_template 'active_tour' }
    update { set_template 'active_tour' }

    edit do
      field :tour, :filter_select_with_defaults
      field :start_date
      field :end_date
      field :tour_hotels do
        eager_load true
      end
      field :tour_coaches do
        eager_load true
      end
      field :ferry_dates
      field :allow_external_agents
      field :insurance_allowed
      field :allow_deposits
      field :self_drive
      field :other_costs
    end

    show do
      set_template 'active_tour_show'
      field :id
      field :tour
      field :start_date
      field :end_date
      field :days
      field :nights
      field :tour_bookings
      field :tour_hotels
      field :tour_coaches
      field :ferry_dates
      field :allow_external_agents
      field :insurance_allowed
      field :allow_deposits
      field :self_drive
      field :other_costs
    end
  end
end
