class RemovePokemonIdFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :pokemon_id, :integer
  end
end
