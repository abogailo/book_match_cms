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

  get '/addToCart' => 'cart#add'
  get '/addToCart' => 'cart#add'

  post '/books/:id/add_to_cart' => "books#add_to_cart", as: "add_to_cart"
  post '/books/:id/remove_from_cart' => "books#remove_from_cart", as: "remove_from_cart"

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"


  get '/auth/:provider/callback' => 'sessions#create'
    
end
