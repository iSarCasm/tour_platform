RailsAdmin.config do |config|
  config.model Role do
    navigation_label 'Settings'
    weight 999

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
