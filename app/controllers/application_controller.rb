class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # skip_before_filter :verify_authenticity_token 
    # skip_before_action :verify_authenticity_token
    def current_user 
        @user = User.find_by_id(session[:user_id])
    end
end
