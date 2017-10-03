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
  end
end
