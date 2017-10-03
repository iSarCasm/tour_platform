RailsAdmin.config do |config|
  config.model Photo do
    weight 100

    list do
      field :id
      field :thumb, :carrierwave
      field :file_size
      field :updated_at
      field :created_at
    end

    edit do
      field :photo, :carrierwave
    end
  end
end
