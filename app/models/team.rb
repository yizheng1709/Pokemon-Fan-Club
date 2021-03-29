class Team < ApplicationRecord
    belongs_to :user 
    has_many :pokemons_teams
    has_many :pokemons, through: :pokemons_teams 
    validate :custom_name_validator
    # validate :custom_pokemons_teams_validator 

    def pokemons_teams_attributes=(pokemon_hash)

        pokemon_hash.values.each do |value|
            poke = Pokemon.find_by_id(value["pokemon_id"]) 
            pt = PokemonsTeam.create(pokemon_nickname: value["pokemon_nickname"])
            pt.pokemon = poke
            pt.team = self 
            pt.save
            self.pokemons_teams << pt
        end
    end

    # def custom_pokemons_teams_validator
    #     if !self.pokemons_teams
    #          self.errors.add(:pokemons_teams, "Pokemon Nickname can't be blank")
    #     end 
    # end

    def custom_name_validator 
        if self.name.nil? || self.name.empty?
            self.errors.add(:name, "Team Name can't be blank.")
        end
    end
    #wrtie custom method to accept nested attributes of pokemonid and nickname, associate with current user
end
