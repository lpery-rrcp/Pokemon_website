class CreateJoinTableMovesPokemons < ActiveRecord::Migration[8.0]
  def change
    create_join_table :moves, :pokemons do |t|
      t.index :move_id
      t.index :type_id
    end
  end
end
