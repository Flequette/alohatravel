Rails.application.routes.draw do
  devise_for :users

  get "local", to: "pages#home_local", as: "local"
  get "joinus", to: "pages#joinus", as: "joinus"
  get "result", to: "pages#result", as: "result"

  get "ask_booking", to: "bookings#ask_booking", as: "demande"
  get "accept_booking", to: "bookings#accept_booking", as: "accepter"
  get "refuse_booking", to: "bookings#accept_booking", as: "refuser"
  get "my_deals", to: "deals#my_deals", as: "my_deals"

  resources :deals do
    resources :bookings
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
