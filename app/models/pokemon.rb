class Pokemon < ApplicationRecord
    has_many :pokemons_teams  
    has_many :teams, through: :pokemons_teams 
    scope(:type_search, ->(query) { self.where("types LIKE ?", "%#{query}%")})
    scope(:name_search, ->(query) { self.where("name LIKE ?", "%#{query}%")})
    scope(:number_search, ->(query) { self.where("pokedex_number LIKE ?", "%#{query}%")})

    
    def check_abilities 
        if self.abilities.include?("[")
            self.abilities = self.abilities.split(",").collect{|a| a.gsub!(/\W+/, ' ').strip}.join(", ")
        end
        self.abilities
    end

    # def self.all_types 
    #     array = []
    #     self.all.each do |p|
    #         if p.types.include?(",")
    #             p.types.split(",").each do |a|
    #                 array << a.strip unless array.include?('a')
    #             end 
    #         else 
    #             array << p.types unless array.include?(p.types) 

    #         end
    #     end
    #     array.uniq
    # end

end
