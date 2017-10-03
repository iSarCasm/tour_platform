RailsAdmin.config do |config|
  config.model CoachBooking do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end
end
