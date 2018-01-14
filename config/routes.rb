Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users

  namespace :ext do
    namespace :admin do
      resources :notes, only: [:index, :create, :destroy]
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :v2admin, path: '/v2/admin' do
    resources :dashboard, only: [:index], path: '/'
  end

  resources :tours, only: [:show] do
    member do
      get 'booking'
    end
  end

  resources :active_tours, only: [:show]

  resources :tour_bookings, only: [:create, :show, :index, :destroy]
end
