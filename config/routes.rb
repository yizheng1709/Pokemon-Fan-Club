Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create_with_github', via: [:get, :post]
  resources :pokemons, only: [:show, :index] 
  resources :movies, only: [:show, :index]
  resources :users, only: [:show, :new, :create] do #show user's homepage; link to every team(if any)
    resources :teams 
  end 
  root 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/mypokemons', to: 'pokemons#mypokemons'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#new
#create
#edit
#update
#show
#index
#delete