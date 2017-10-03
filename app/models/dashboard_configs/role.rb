RailsAdmin.config do |config|
  config.model Role do
    list do
      field :id
      field :name
      field :description
      field :permissions
      field :users
    end

    edit do
      exclude_fields :role_permissions
    end
  end
end
