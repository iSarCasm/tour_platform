RailsAdmin.config do |config|
  config.model PickupList do
    list do
      field :id
      field :tour_coach
      field :pickup_points do
        eager_load true
      end
    end
  end
end
