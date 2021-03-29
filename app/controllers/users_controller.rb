class UsersController < ApplicationController
    def show 
        if current_user
            @t = DateTime.now
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
        @user = User.create(user_params)
        # binding.pry
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @errors = @user.errors.full_messages
            render :new, layout: 'welcome'
        end
    end

    private 
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end