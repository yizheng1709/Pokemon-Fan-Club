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
            redirect_to new_user_path 
        end 
    end
end