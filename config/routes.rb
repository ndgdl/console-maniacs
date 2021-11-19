Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consoles do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:create, :index] do
    member do
      post :approve
      post :deny
    end
  end

  get '/users/bookings/', to: "bookings#index", as: :booked_consoles
  get '/users/consoles/', to: "pages#owned_consoles", as: :owned_consoles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
