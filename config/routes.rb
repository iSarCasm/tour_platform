Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users

  namespace :ext do
    namespace :admin do
      resources :notes, only: [:index, :create, :destroy]
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :tours, only: [:show] do
    member do
      get 'booking'
    end
  end

  resources :tour_bookings, except: [:new, :edit, :update]

  get ':active_tour_slug', to: 'tour_bookings#new', as: 'new_tour_booking'
end
