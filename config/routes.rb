Rails.application.routes.draw do
  devise_for :users

  root "posts#index"

  get "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :posts
  resources :users, only:[:new, :create]
end