Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :pokemons, :teams 
  resources :users, only: [:show, :new, :create] do #show user's homepage; link to every team(if any)
    resources :teams 
  end 
  root 'session#home'
  get '/login', to: 'session#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
