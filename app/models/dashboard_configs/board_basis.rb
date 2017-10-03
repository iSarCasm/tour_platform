RailsAdmin.config do |config|
  config.model BoardBasis do
    navigation_label 'Settings'
    weight 999
    
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
