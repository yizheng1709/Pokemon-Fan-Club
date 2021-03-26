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

    def measurement_params
      params.require(:measurement).permit(:quantity, :unit, :item_id)
    end
end