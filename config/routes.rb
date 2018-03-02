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

  resources :tour_bookings, only: [:index, :show, :destroy]
  get   ':active_tour_slug',        to: 'tour_bookings#new',    as: 'new_tour_booking'
  post  ':active_tour_slug/order',  to: 'tour_bookings#create', as: 'create_tour_booking'
end
