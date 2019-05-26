Rails.application.routes.draw do

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/help' => "static_pages#help"

  get '/about', to: "static_pages#about"
  # these are variations of each other.

  get '/contact', :to => "static_pages#contact"
  # i wonder if this last variation will work, the full hash syntax.

  root 'static_pages#home'

  get '/hello' => "application#hello"

  resources :users
end
