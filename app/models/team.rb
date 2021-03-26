class Team < ApplicationRecord
    belongs_to :user 
    has_many :pokemons_teams
    has_many :pokemons, through: :pokemons_teams 
    validates_presence_of :name

    def pokemons_attributes=(pokemon_hash)
        binding.pry
        pokemon_hash.values.each do |value|
            #each value will have pokemon_id and nickname
            #wont be creating any new pokemon
            pokemon = Pokemon.find_by_id(value) 
            #self = team instance
            self.pokemons << pokemon 
        end
    end
    #wrtie custom method to accept nested attributes of pokemonid and nickname, associate with current user
end
