Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consoles do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create, :index]

  get '/users/:id/bookings/', to: "bookings#index", as: :booked_consoles
  get '/users/:id/consoles/', to: "pages#owned_consoles", as: :owned_consoles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
