class Team < ApplicationRecord
    belongs_to :user 
    has_many :pokemons_teams
    has_many :pokemons, through: :pokemons_teams 
    validates_presence_of :name

    def pokemons_teams_attributes=(pokemon_hash)
        # binding.pry
        pokemon_hash.values.each do |value|
            #each value will have pokemon_id and nickname
            #wont be creating any new pokemon
            # binding.pry
            poke = Pokemon.find_by_id(value["pokemon_id"]) 
            # binding.pry
            pt = PokemonsTeam.create(pokemon_nickname: value["pokemon_nickname"])
            pt.pokemon = poke
            pt.team = self 
            pt.save
            self.pokemons_teams << pt
        end
    end
    #wrtie custom method to accept nested attributes of pokemonid and nickname, associate with current user
end
