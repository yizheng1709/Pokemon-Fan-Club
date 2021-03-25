class SessionsController < ApplicationController 
    # protect_from_forgery prepend: true
    # skip_before_action :verify_authenticity_token, only: :create
    def home 
        render layout: "welcome"
    end
    def create
        pp request.env['omniauth.auth']
    
        # We're going to save the authentication information in the session
        # for demonstration purposes. We want to keep this data somewhere so that,
        # after redirect, we have access to the returned data
        session[:name] = request.env['omniauth.auth']['info']['name']
        session[:omniauth_data] = request.env['omniauth.auth']
    
        redirect_to user_path(current_user)
        #should I create a user with the datbase?
      end
end