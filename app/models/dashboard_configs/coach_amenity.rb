RailsAdmin.config do |config|
  config.model CoachAmenity do
    list do
      field :id
      field :name
      field :tour_coaches do
        eager_load true
      end
    end

    edit do
      field :name
    end
  end
end
