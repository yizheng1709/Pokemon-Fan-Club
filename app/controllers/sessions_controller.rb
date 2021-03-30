class SessionsController < ApplicationController 
    layout "welcome"
    def home 
    end
    def new 
        render :"/users/new"
    end

    def create 
        user = User.find_by_name(params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            @errors = ["This username and password combination cannot be found."]
            render :"/users/new"
        end
    end
    def destroy 
        session.clear 
        redirect_to root_path
    end

    def create_with_github
        user = User.find_or_create_by(name: github_name) do |u|
            u.password = 'ThisIsADummyPasswordThatBcrpytNeedsSoThatTheUserWillSave'
            u.image = github_image
            u.save
        end
        if user
            session[:user_id] = user.id
            redirect_to user_path(current_user)
        else 
            redirect_to root_path
        end 
    end

    private 
    def github_name
        request.env['omniauth.auth']['info']['name']
    end
    def github_image 
        request.env['omniauth.auth']['info']['image']
    end
end