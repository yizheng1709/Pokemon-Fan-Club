class TeamsController < ApplicationController
    layout "main"
    # before_action(:set_team, except: [:index, :new, :create])
    before_action(:redirect_to_root)
    
    def show
        # if current_user
            set_team
            @pokemons = @team.pokemons_teams 
            render :show
        # else 
        #     redirect_to root_path 
        # end    
    end
    def index 
        # if current_user 
            @teams = current_user.teams
            render :index 
        # else 
        #     redirect_to root_path
        # end 
    end
    def new
        # if current_user
            @team = @user.teams.build
            6.times { @team.pokemons_teams.build }
            @pokemons = Pokemon.all
        #   else
        #     redirect_to root_path
        #   end
    end
    def create 
        @team = Team.create(team_params)
        @team.update(user: current_user)
        if @team.save
            redirect_to user_team_path(@user, @team)
        else 
            @errors = @team.errors.messages.values
            @pokemons = Pokemon.all
            @errors = @errors.map {|e| e.include?("is invalid") ? ["Pokémon Nickname can't be blank"] : e }
            render :new 
        end 
    end

    def edit 
        # if current_user 
            set_team
            @pokemons = Pokemon.all
        # else 
        #     redirect_to root_path
        # end 
    end

    def update
        set_team

    
        if @team.update(team_params)

            redirect_to user_team_path(@user, @team)
        else 
            @errors = @team.errors.full_messages
            binding.pry
            @errors.map {|e| e.include?("teams") ? "Pokemon Nickname can't be blank" : e }
            render :edit
        end

    end

    def destroy 
        # if current_user 
            set_team
            PokemonsTeam.where(team_id: params[:id]).destroy_all
            @team.destroy 
            redirect_to user_teams_path(@user)
        # else 
        #     redirect_to root_path
        # end

    end

    private

    def team_params
      params.require(:team).permit(:user_id, :name, :pokemons_teams_attributes => [:pokemon_nickname, :pokemon_id, :id])
    end

    def set_team
        @team = @user.teams.find_by_id(params[:id])
    end
    
end