RailsAdmin.config do |config|
  config.model SeatType do
    navigation_label 'Settings'
    weight 999

    edit do
      field :name
      field :price
      field :char
      field :is_seat
      field :color, :color
    end

    list do
      field :char
      field :name
      field :is_seat
      field :color
      field :price
    end
  end
end
