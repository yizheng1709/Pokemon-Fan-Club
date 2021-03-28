class TeamsController < ApplicationController
    layout "main"
    # before_action(:set_team, except: [:index, :new, :create])
    
    def show
        if current_user
            set_team
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
        if @team.save
            redirect_to user_team_path(@user, @team)
        else 
            render :new 
        end 
    end

    def edit 
        if current_user 
            set_team
            @pokemons = Pokemon.all
        else 
            redirect_to root_path
        end 
    end

    def update
        if current_user
            set_team 
            @team.save 
            redirect_to user_team_path(@user, @team)
        else 
            @errors = @team.errors.full_messages
            render :edit
        end

    end

    def destroy 
        if current_user 
            set_team
            PokemonsTeam.where(team_id: params[:id]).destroy_all
            @team.destroy 
            redirect_to user_teams_path(@user)
        else 
            redirect_to user_teams_path(@user)
        end

    end

    private

    def team_params
      params.require(:team).permit(:user_id, :name, :pokemons_teams_attributes => [:pokemon_nickname, :pokemon_id])
    end

    def set_team
        @team = @user.teams.find_by_id(params[:id])
    end
    
end