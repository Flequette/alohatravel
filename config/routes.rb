Rails.application.routes.draw do
  devise_for :users

  get "local", to: "pages#home_local", as: "local"

  resources :deals do
    resources :bookings, only: [:show, :create, :edit, :update, :destroy]
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
