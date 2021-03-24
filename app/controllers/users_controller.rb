class UsersController < ApplicationController
    def show 
        if current_user
            @user = current_user 
            render layout: "main"
        else 
            redirect_to root_path
        end
    end
    def new 
        if !current_user 
            @user = User.new
            render root_path 
        else 
            redirect_to user_path(current_user)
        end
    end
    def login 
        # if current_user 
            # redirect_to user_path(current_user)
        # else 
            # redirect_to user_path(current_user)
            @user = User.new
            render :layout => "welcome"
        # end
    end
end