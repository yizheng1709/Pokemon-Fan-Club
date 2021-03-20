class User < ApplicationRecord
    has_many :teams
    has_many :pokemons, through: :teams
    has_secure_password
end
