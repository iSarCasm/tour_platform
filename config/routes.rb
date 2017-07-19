Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'static_pages#home'
  resources :tours, only: [:show] do
    member do
      get 'booking'
    end
  end
end
