class TeamsController < ApplicationController
    layout "main"
    def show
        if current_user
            # binding.pry
            @team = @user.teams.find_by(id: params[:id])
            @pokemons = @team.pokemons 
            render :show
        else 
            redirect_to root_path 
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
            6.times { @team.pokemons_teams.build }
            @pokemons = Pokemon.all
          else
            redirect_to root_path
          end
    end
    def create 
        @team = Team.create(team_params)
        @team.user = current_user
        # binding.pry
        if @team.save
            redirect_to user_team_path(@user, @team)
        else 
            render :new 
        end 
    end

    def edit 

    end
    def update

    end
    def destroy 

    end

    private

    def team_params
      params.require(:team).permit(:user_id, :name, :pokemons_teams_attributes => [:pokemon_nickname, :pokemon_id])
    end
end