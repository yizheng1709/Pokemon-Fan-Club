module TeamsHelper
    def team_url_helper(team, user)
        if team.id 
            user_team_path(user, team)
        else 
            user_teams_path(user)
        end
    end

    def create_or_edit(team)
        if !team.id 
            "Create Dream Team"
        else
            "Edit Team #{team.name}"
        end
    end

end 