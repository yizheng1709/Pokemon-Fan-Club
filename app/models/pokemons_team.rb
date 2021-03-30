class PokemonsTeam < ApplicationRecord
    belongs_to :pokemon 
    belongs_to :team
    validates :pokemon_nickname, presence: {message: "Pokémon nickname can't be blank"}

    
end
