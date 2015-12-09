Rails.application.routes.draw do
  root to: 'posts#index'

  get '/pages/:page', to: "pages#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts do
  	resources :comments
  end
  
end
