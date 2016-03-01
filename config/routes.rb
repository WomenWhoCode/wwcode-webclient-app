Rails.application.routes.draw do
  devise_for :users
  
  root to: "pages#index"

  resources :events
  resources :routes
  resources :pages
  resources :personalization_details
  resources :profiles


  namespace :users do
    get "/registrations/sign_up", to: "registrations#new"
    post "/registrations", to: "registrations#create"
    get "/sessions/sign_in", to: "sessions#new"
    post "/sessions", to: "sessions#create"
  end

end