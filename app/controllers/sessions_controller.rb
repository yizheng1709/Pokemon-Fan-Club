class SessionsController < ApplicationController 
    # protect_from_forgery prepend: true
    # skip_before_action :verify_authenticity_token, only: :create
    def home 
        render layout: "welcome"
    end
    def new 

    end
    def create 

    end
    def destroy 
        session.clear 
        redirect_to root_path
    end

    def create_with_github
        binding.pry
        user = User.find_or_create_by(name: github_name) do |u|
            u.password = 'ThisIsADummyPasswordThatBcrpytNeedsSoThatTheUserWillSave'
            u.image = 
        end
        if user.save 
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
end