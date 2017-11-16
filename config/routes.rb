Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :v2admin, path: '/v2/admin' do
    get '/', to: 'dashboards#index'
  end


  get 'tour_hotel/:id/interim_report', to: 'tour_hotel#interim_report', as: 'tour_hotel_interim_report'

  resources :tours, only: [:show] do
    member do
      get 'booking'
    end
  end

  resources :active_tours, only: [:show]

  resources :tour_bookings, only: [:create, :show, :index, :destroy]
end
