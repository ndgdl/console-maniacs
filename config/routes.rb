Rails.application.routes.draw do
  get 'consoles/index'
  get 'consoles/show'
  devise_for :users
  root to: 'pages#home'
  resources :consoles, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
