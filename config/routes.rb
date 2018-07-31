Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "joinus", to: "pages#joinus", as: "joinus"
  get "result", to: "pages#result", as: "result"
  get "legal", to: "pages#legal", as: "legal"
  get "contact", to: "pages#contact", as: "contact"
  get "home_local", to: "pages#home_local", as: "home_local"

  get "ask_booking", to: "bookings#ask_booking", as: "demande"
  get "accept_booking", to: "bookings#accept_booking", as: "accepter"
  get "refuse_booking", to: "bookings#accept_booking", as: "refuser"
  get "my_deals", to: "deals#my_deals", as: "my_deals"

  resources :deals do
    resources :bookings
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
