class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :pokemon_id
      t.string :pokemon_nickname

      t.timestamps
    end
  end
end
