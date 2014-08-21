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

ActiveRecord::Schema.define(version: 20140815171854) do

  create_table "favorite_games", force: true do |t|
    t.string   "game_id"
    t.string   "integer"
    t.string   "user_id"
    t.string   "favorite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_games", ["favorite_id"], name: "index_favorite_games_on_favorite_id"
  add_index "favorite_games", ["game_id", "user_id", "favorite_id"], name: "index_favorite_games_on_game_id_and_user_id_and_favorite_id", unique: true
  add_index "favorite_games", ["game_id"], name: "index_favorite_games_on_game_id"
  add_index "favorite_games", ["user_id"], name: "index_favorite_games_on_user_id"

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.string   "console"
    t.string   "genre"
    t.integer  "release_date"
    t.integer  "reviewed"
    t.integer  "stars"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ratings_count", default: 0,   null: false
    t.integer  "rating_total",  default: 0,   null: false
    t.decimal  "rating",        default: 0.0, null: false
  end

  create_table "images", force: true do |t|
  end

  create_table "reviews", force: true do |t|
    t.string   "username"
    t.text     "body"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
    t.integer  "age"
    t.string   "birthday"
    t.string   "location"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
