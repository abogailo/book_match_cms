Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"

  resources :users do
    resources :favorites
  end
  resources :sessions, only: [:new, :create]

  resources :books do
    resources :reviews
  end
  resources :authors
  resources :genres
  resources :reviews, only: [:new, :create, :destroy]
  post '/sessions' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => "sessions#new"

  post '/books/:id/favorite', to: "books#favorite", as: "favorite_book"
  post '/books/:id/unfavorite', to: "books#unfavorite", as: "unfavorite_book"
  
    
end
