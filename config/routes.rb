Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'static_pages#home'

  resources :tours, only: [:show] do
    member do
      get 'booking'
    end
  end

  resources :active_tours, only: [:show]

  resources :tour_bookings, only: [:create, :show, :index, :destroy]
end
