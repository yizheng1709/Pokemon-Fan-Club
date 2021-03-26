class Team < ApplicationRecord
    belongs_to :user 
    has_many :pokemons_teams
    has_many :pokemons, through: :pokemons_teams 
    validates_presence_of :name

    #wrtie custom method to accept nested attributes of pokemonid and nickname, associate with current user
end
