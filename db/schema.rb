# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_08_004137) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "accuracy"
    t.integer "power"
    t.integer "pp"
    t.string "category"
    t.string "move_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves_pokemons", id: false, force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "pokemon_id", null: false
    t.index ["move_id", "pokemon_id"], name: "index_moves_pokemons_on_move_id_and_pokemon_id"
    t.index ["pokemon_id", "move_id"], name: "index_moves_pokemons_on_pokemon_id_and_move_id"
  end

  create_table "moves_types", force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_moves_types_on_move_id"
    t.index ["type_id"], name: "index_moves_types_on_type_id"
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemon_types_on_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "pokedex_id"
    t.integer "base_hp"
    t.integer "base_attack"
    t.integer "base_defense"
    t.integer "base_sp_attack"
    t.integer "base_sp_defense"
    t.integer "base_speed"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
    t.index ["type_id", "pokemon_id"], name: "index_pokemons_types_on_type_id_and_pokemon_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "moves_types", "moves"
  add_foreign_key "moves_types", "types"
  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
end
