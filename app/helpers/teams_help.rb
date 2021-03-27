module TeamsHelper

    def nickname(team) 
        #cuz find_by finds the first result, this method will only work if the user chooses different pokemon
        team.pokemons_teams.find_by(pokemon_id: poke.id).pokemon_nickname
        # @pt = PokemonsTeam.where("team_id = ?", @team.id)
        

        #need to call it on the team
        #need specific pokemons_team id so that nickname is unique to this pokemon
        #select pokemon_nickname 
        #from pokemons_team 
        #where team_id = @team.id AND pokemon_id = current poke.id
    end
end 