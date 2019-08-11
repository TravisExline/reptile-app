Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#index'
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'session#create'
  delete '/posts/:id', to: 'posts#destroy'

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :create, :edit] do
    resources :reptiles, only: [:show, :index, :new, :edit]
  end
  resources :reptiles, only: [:index, :show, :new, :create, :edit, :update]
end
