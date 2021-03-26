class CreatePokemonsTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons_teams do |t|
      t.integer :pokemon_id
      t.integer :team_id
      t.string :pokemon_nickname

      t.timestamps
    end
  end
end
