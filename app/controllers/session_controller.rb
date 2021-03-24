class SessionController < ApplicationController 
    def home 
        render layout: "welcome"
    end
end