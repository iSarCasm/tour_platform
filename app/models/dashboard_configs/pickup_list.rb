RailsAdmin.config do |config|
  config.model PickupList do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :tour_coach
      field :pickup_points do
        eager_load true
      end
    end
  end
end
