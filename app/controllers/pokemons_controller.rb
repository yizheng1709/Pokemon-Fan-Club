class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
    end

    def show 
        @pokemon = Pokemon.find_by(id: params[:id])
    end

end