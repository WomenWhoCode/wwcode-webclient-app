Rails.application.routes.draw do
  devise_for :users
  
  root to: "pages#index"

  resources :events
  resources :routes
  resources :pages
  resources :personalization_details
  resources :profiles

  get "/user_accounts/sign_up", to: "user_accounts#sign_up"
  post "user_accounts/new", to: "user_accounts#new"
  get "/user_accounts/sign_in", to: "user_accounts#sign_in"
  post "user_accounts", to: "user_accounts#create"

end