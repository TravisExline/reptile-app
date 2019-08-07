Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#index'
  post '/signin' => 'session#create'
  get '/signin' => 'session#new'
  get '/logout' => 'session#destroy'

  resources :posts
  resources :users
  resources :reptiles
end
