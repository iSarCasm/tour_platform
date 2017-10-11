RailsAdmin.config do |config|
  config.model TourType do
    navigation_label 'Settings'
    weight 999

    list do
      field :id
      field :name
      field :tours
    end

    edit do
      field :name
    end
  end
end
