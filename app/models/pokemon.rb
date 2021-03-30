class Pokemon < ApplicationRecord
    has_many :pokemons_teams  
    has_many :teams, through: :pokemons_teams 
    scope(:pokedex_number_search, ->(query) { self.where("pokedex_number = ?", query) })

    
    def check_abilities 
        if self.abilities.include?("[")
            self.abilities = self.abilities.split(",").collect{|a| a.gsub!(/\W+/, ' ').strip}.join(", ")
        end
        self.abilities
    end

    # def self.random_gen
    #     self.find_by(id: rand(1..899)).id
    # end
end
