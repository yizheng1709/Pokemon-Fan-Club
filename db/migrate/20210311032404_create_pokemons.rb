class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.string :weaknesses
      t.string :abilities
      t.text :description
      t.string :image
      t.string :height
      t.string :weight
      t.string :pokedex_number

      t.timestamps
    end
  end
end
