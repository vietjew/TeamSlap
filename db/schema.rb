# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141101234015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: true do |t|
    t.integer  "player_id",                   null: false
    t.integer  "game_id",                     null: false
    t.integer  "available_value", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["game_id"], name: "index_availabilities_on_game_id", using: :btree
  add_index "availabilities", ["player_id", "game_id"], name: "index_availabilities_on_player_id_and_game_id", unique: true, using: :btree
  add_index "availabilities", ["player_id"], name: "index_availabilities_on_player_id", using: :btree

  create_table "formation_positions", force: true do |t|
    t.string   "name"
    t.integer  "formation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formations", force: true do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "league_id"
    t.integer  "team1_id",       null: false
    t.integer  "team2_id",       null: false
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.integer  "location_id"
    t.string   "location_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date",           null: false
    t.string   "time",           null: false
    t.string   "team2_name"
  end

  create_table "leagues", force: true do |t|
    t.integer  "sport_id",          null: false
    t.integer  "league_manager_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              null: false
  end

  create_table "lineup_positions", force: true do |t|
    t.integer  "lineup_id",  null: false
    t.string   "name"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lineup_positions", ["lineup_id", "player_id"], name: "index_lineup_positions_on_lineup_id_and_player_id", unique: true, using: :btree

  create_table "lineups", force: true do |t|
    t.integer  "team_id",    null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lineups", ["team_id", "game_id"], name: "index_lineups_on_team_id_and_game_id", unique: true, using: :btree

  create_table "locations", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roster_adds", force: true do |t|
    t.integer  "team_id",    null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sports", ["name"], name: "index_sports_on_name", unique: true, using: :btree

  create_table "team_adds", force: true do |t|
    t.integer  "league_id",  null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.integer  "manager_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id",   null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
