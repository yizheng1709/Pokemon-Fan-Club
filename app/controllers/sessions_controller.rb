class SessionsController < ApplicationController 
    # protect_from_forgery prepend: true
    # skip_before_action :verify_authenticity_token, only: :create
    def home 
        render layout: "welcome"
    end
    def new 
        @user = User.new 
    end
    def create 

    end
    def destroy 
        session.clear 
        redirect_to root_path
    end

    def create_with_github
        # binding.pry
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
    def session_params 
        params.require(:user).permit(:name, :password)
    end
end