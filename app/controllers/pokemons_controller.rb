class PokemonsController < ApplicationController
    layout "main"
    def index
        @pokemons = Pokemon.all
        # render :layout => "main"
    end

    def show 
        @pokemon = Pokemon.find_by(id: params[:id])
    end

end