Rails.application.routes.draw do
  # resources :topics
  # resources :user_topics
  resources :tweets
  # resources :targets
  resources :users, only: [:create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home'

  get '/login' => 'sessions#new'
  get '/signup' => 'users#signup', as: 'signup'
  post '/login' => 'sessions#create'
  post  '/factsearch' => 'tweets#getfact'
end
