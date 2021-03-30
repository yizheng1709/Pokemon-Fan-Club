module ApplicationHelper
    def current_user 
        @user = User.find_by(id: session[:user_id])
    end
    def start_or_continue(controller)
        # binding.pry
        if controller.controller_name == "users" 
            "Start My Pokemon Journey"
        else 
            "Continue My Pokemon Journey"
        end
    end
    def begin_or_continue_journey(controller)
        if controller.controller_name == "users" 
            "Start Your Pokémon Journey Now"
        else 
            "Login Here to Continue Your Pokémon Journey"
        end
    end
    def start_or_continue_with_github(controller)
        if controller.controller_name == "users" 
            "Start with GitHub"
        else 
            "Continue with GitHub"
        end
    end
    def random_movie_or_pokemon
        a = rand(2)
        if a == 0
            pokemon_path(rand(1..899))
        else 
            movie_path(rand(1..22))
        end
    end
end
