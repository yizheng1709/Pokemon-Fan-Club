class PokemonsController < ApplicationController
    layout "main"
    def index
        if params[:query] && !params[:query].empty?
            # binding.pry
            @pokemons = Pokemon.type_search(params[:query])
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