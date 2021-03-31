class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # skip_before_filter :verify_authenticity_token 
    # skip_before_action :verify_authenticity_token
    def current_user 
        @user = User.find_by_id(session[:user_id])
    end
    def redirect_to_root
        if !current_user 
            redirect_to root_path
        end
    end

    def correct_user 
        if current_user != User.find_by_id(params[:user_id])
            redirect_to user_path(current_user)
        end
    end
    # def begin_or_continue_journey(controller)
    #     if controller.class == UsersController 
    #         "Start Your Pokémon Journey Now"
    #     else 
    #         "Login Here to Continue Your Pokémon Journey"
    #     end
    # end
end
