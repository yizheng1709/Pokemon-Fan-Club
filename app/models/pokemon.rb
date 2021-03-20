class Pokemon < ApplicationRecord
    has_many :teams 
    has_many :users, through: :teams 
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
