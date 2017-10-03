RailsAdmin.config do |config|
  config.model HotelBooking do
    parent TourBooking
    list do
      exclude_fields :created_at, :updated_at
    end
  end
end
