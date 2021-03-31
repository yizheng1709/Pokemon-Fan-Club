class PokemonsController < ApplicationController
    layout "main"
    def index
        # binding.pry
        if params[:searching_for]
            p = params[:searching_for]
            if p == "types"
                @pokemons = Pokemon.type_search(params[:query])
            elsif p == "name"
                @pokemons = Pokemon.name_search(params[:query])
            else 
                @pokemons = Pokemon.number_search(params[:query])
            end 
        else 
            @pokemons = Pokemon.all
        end
    end

    def show 
        @pokemon = Pokemon.find_by(id: params[:id])
    end

end