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
        @errors = @team.errors.messages 
        # binding.pry
        if @errors.empty? && @team.save
            # binding.pry
            redirect_to user_team_path(@user, @team)
        else 
            @pokemons = Pokemon.all
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
        # @team.pokemons_teams.update(pokemon)
        # @team.pokemons_teams.each do |poke_member|
        #     poke_member.update(update_team_params)
        # endn
    
        if @team.update(team_params)
            # @team.pokemons_teams.update(update_team_params) 
            binding.pry
            redirect_to user_team_path(@user, @team)
        else 
            @errors = @team.errors.full_messages
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

    # def update_team_params 
    #     params.permit(:pokemon_nickname, :pokemon_id)   
    # end

    def team_params
      params.require(:team).permit(:user_id, :name, :pokemons_teams_attributes => [:pokemon_nickname, :pokemon_id])
    end

    def set_team
        @team = @user.teams.find_by_id(params[:id])
    end
    
end