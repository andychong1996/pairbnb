Rails.application.routes.draw do

  root 'home#index'

  resources :users, except: [:new, :create]
  get "/sign_up", to: "registrations#new", as: "sign_up_form"
  post "/sign_up", to: "registrations#create", as: "sign_up"

  resources :sessions, only: [:new, :create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
