RailsAdmin.config do |config|
  config.model Permission do
    navigation_label 'Settings'
    weight 999
    
    list do
      field :id
      field :action
      field :subject_class
      field :subject_id
      field :roles do
        eager_load true
      end
    end

    edit do
      field :subject_class
      field :action
      field :subject_id
      field :roles
    end
  end
end
