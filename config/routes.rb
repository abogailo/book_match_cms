Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"
  
  namespace :admin do
    resources :creators
  end
  
  resources :users, :except => [:index]
  resources :sessions, only: [:new, :create]
  resources :books do
    resources :reviews, only: [:index, :show]
  end
  resources :authors
  resources :genres


  resources :reviews
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"


  get '/auth/:provider/callback' => 'sessions#create'
    
end
