class User < ApplicationRecord
    has_many :teams
    has_many :pokemons, through: :teams
    has_secure_password
    validates_presence_of :name
    validates_uniqueness_of :name
end
