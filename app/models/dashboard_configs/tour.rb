RailsAdmin.config do |config|
  config.model Tour do
    edit do
      field :title
      field :description
      field :active_tours do
        eager_load true
      end
    end

    list do
      field :id
      field :title
      field :description
      field :active_tours do
        eager_load true
      end
    end
  end
end
