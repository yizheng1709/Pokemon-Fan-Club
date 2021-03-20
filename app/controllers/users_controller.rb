class UsersController < ApplicationController
    def show 
        if current_user
            @user = current_user 
            render layout: "main"
        else 
            redirect_to new_user_path
        end
    end
    def new 
        if !current_user 
            render :new 
        else 
            redirect_to user_path(current_user)
        end
    end
    def login 
        if !current_user 
            render :login 
        else 
            redirect_to user_path(current_user)
        end
    end
end