RailsAdmin.config do |config|
  config.model User do
    list do
      exclude_fields :created_at, :updated_at
    end

    edit do
      exclude_fields :tour_bookings
    end
  end
end
