class PokemonsController < ApplicationController
    layout "main"
    def index
        # binding.pry
        if params[:query] && !params[:query].empty?
            @pokemons = Pokemon.pokedex_number_search(params[:query].to_i)
            # binding.pry
        else 
            @pokemons = Pokemon.all
        end
    end

    def show 
        @pokemon = Pokemon.find_by(id: params[:id])
    end

    private 
    def query_params
        params.permit(:query)
    end

end