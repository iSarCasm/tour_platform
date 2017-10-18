# == Schema Information
#
# Table name: active_tours
#
#  id         :integer          not null, primary key
#  tour_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
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
    end

    edit do
      field :tour
      field :start_date
      field :end_date
      field :tour_hotels do
        eager_load true
      end
      field :tour_coaches do
        eager_load true
      end
    end

    show do
      field :id
      field :tour
      field :start_date
      field :end_date
      field :days
      field :nights
      field :tour_bookings
      field :tour_hotels
      field :tour_coaches
    end
  end
end
