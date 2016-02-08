Rails.application.routes.draw do
  devise_for :users
  
  root to: "pages#index"

  resources :events
  resources :routes
  resources :interests
  resources :hopes
  resources :experiences
  resources :pages
  resources :profiles

end