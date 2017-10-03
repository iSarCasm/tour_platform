RailsAdmin.config do |config|
  config.model Facility do
    list do
      field :id
      field :facility
      field :hotels do
        eager_load true
      end
    end

    edit do
      field :facility
    end
  end
end
