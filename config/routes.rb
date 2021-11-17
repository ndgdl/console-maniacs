Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consoles
  get '/users/:id/consoles/', to: "pages#owned_consoles"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
