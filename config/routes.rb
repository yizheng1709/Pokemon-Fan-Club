Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create_with_github', via: [:get, :post]
  resources :pokemons 
  resources :users, only: [:show, :new, :create] do #show user's homepage; link to every team(if any)
    resources :teams 
  end 
  root 'sessions#home'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
