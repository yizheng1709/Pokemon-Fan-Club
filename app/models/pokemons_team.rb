class PokemonsTeam < ApplicationRecord
    belongs_to :pokemon 
    belongs_to :team
    
end
