RailsAdmin.config do |config|
  config.model BoardBasis do
    list do
      field :id
      field :title
      field :tour_hotels do
        eager_load true
      end
    end

    edit do
      field :title
    end
  end
end
