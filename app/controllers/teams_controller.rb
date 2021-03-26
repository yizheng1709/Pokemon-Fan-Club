class TeamsController < ApplicationController
    def show
        if current_user 
            @team = Team.find_by(id: params[:id])
            render :show
        else 
            redirect_to new_user_path 
        end    
    end
    def index 
        if current_user 
            @teams = current_user.teams
            render :index 
        else 
            redirect_to root_path
        end 
    end
    def new
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @team = @user.teams.build
            @pokemons = Pokemon.all
          else
            redirect_to root_path
          end
    end
    def create 

    end
    def edit 

    end
    def update

    end
    def destroy 

    end

    private

    def team_params
      params.require(:team).permit(:user_id, :pokemon_id, :name)
    end
end