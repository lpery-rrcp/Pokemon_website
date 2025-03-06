class CreateMoves < ActiveRecord::Migration[8.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.integer :power
      t.integer :pp
      t.string :category
      t.string :move_type

      t.timestamps
    end
  end
end
