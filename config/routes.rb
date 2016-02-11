Rails.application.routes.draw do
  devise_for :users
  
  root to: "pages#index"

  resources :events
  resources :routes
  resources :pages
  resources :personalization_details

end