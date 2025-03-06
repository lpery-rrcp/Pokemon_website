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

ActiveRecord::Schema[8.0].define(version: 2025_03_06_032722) do
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
end
