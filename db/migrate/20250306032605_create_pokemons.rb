class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_id
      t.integer :base_hp
      t.integer :base_attack
      t.integer :base_defense
      t.integer :base_sp_attack
      t.integer :base_sp_defense
      t.integer :base_speed
      t.string :type

      t.timestamps
    end
  end
end
