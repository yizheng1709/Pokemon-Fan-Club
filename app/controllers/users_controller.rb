class UsersController < ApplicationController
    def show 
        if current_user
            # binding.pry
            render :show, layout: "main"
        else 
            redirect_to root_path
        end
    end
    def new 
        if !current_user 
            @user = User.new
            render :new, layout: 'welcome'
        else 
            redirect_to user_path(current_user)
        end
    end
    def create 
        if !current_user 
            @user = User.create(user_params)
        else 
            redirect_to user_path(current_user)
        end
    end
    private 
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end