Rails.application.routes.draw do

  get 'users/new'

  get '/help' => "static_pages#help"

  get '/about', to: "static_pages#about"
  # these are variations of each other.

  get '/contact', :to => "static_pages#contact"
  # i wonder if this last variation will work, the full hash syntax.

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get '/hello' => "application#hello"

end
