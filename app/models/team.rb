class Team < ApplicationRecord
    belongs_to :user 
    has_many :pokemons_teams
    has_many :pokemons, through: :pokemons_teams 
    validate :custom_name_validator

    def pokemons_teams_attributes=(pokemon_hash)

        pokemon_hash.values.each do |value|
            poke = Pokemon.find_by_id(value["pokemon_id"]) 
            if poketeam = PokemonsTeam.find_by_id(value["id"])
                poketeam.update(pokemon_nickname: value[:pokemon_nickname])
            else 
                pt = PokemonsTeam.create(pokemon_nickname: value["pokemon_nickname"], pokemon: poke)
                self.pokemons_teams << pt
            end
        end
    end

    def custom_name_validator 
        if self.name.nil? || self.name.empty?
            self.errors.add(:name, "Team Name can't be blank")
        end
    end
end
