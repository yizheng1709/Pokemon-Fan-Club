class MoviesController < ApplicationController
    before_action(:redirect_to_root)
    layout "main"

    def show 
        @movie = Movie.find_by_id(params[:id])
    end

    def index 
        @movies = Movie.all 
    end
end