Rails.application.routes.draw do
  root to: 'posts#index'

  get '/pages/:page', to: 'pages#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/categories', to: 'categories#index'
  
  resources :posts do
  	resources :comments
  end

  resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:edit, :update]
  
end
