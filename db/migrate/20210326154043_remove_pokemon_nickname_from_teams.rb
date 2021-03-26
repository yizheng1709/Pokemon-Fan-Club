class RemovePokemonNicknameFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :pokemon_nickname, :string
  end
end
