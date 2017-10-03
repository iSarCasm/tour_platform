RailsAdmin.config do |config|
  config.model TourBooking do
    list do
      exclude_fields :created_at, :updated_at
    end
  end
end
