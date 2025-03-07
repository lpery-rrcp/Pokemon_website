class CreateMovesTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :moves_types do |t|
      t.references :move, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
