Rails.application.routes.draw do
  resources :topics
  resources :user_topics
  resources :tweets
  resources :targets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'application#home'
  get '/login' => 'sessions#login'
  get '/signup' => 'sessions#signup'
end
