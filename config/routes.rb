Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"

  resources :users, :except => [:index]
  resources :sessions, only: [:new, :create]

  resources :books do
    resources :reviews, only: [:index, :show]
  end

  resources :authors
  resources :genres
  resources :reviews
  
  post '/sessions' => "sessions#create"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"
    
end
