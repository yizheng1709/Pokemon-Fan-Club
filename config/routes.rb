Rails.application.routes.draw do
  resources :pokemons, :teams 
  resources :users, only: [:show, :new, :create] #show user's homepage; link to every team(if any)
  get '/', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
