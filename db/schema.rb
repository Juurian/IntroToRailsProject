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

ActiveRecord::Schema[7.0].define(version: 2023_10_09_214620) do
  create_table "cheap_games", force: :cascade do |t|
    t.integer "game_summary_id"
    t.string "title"
    t.string "metacritic_link"
    t.integer "metacritic_score"
    t.string "steam_rating_text"
    t.integer "steam_rating_percent"
    t.integer "steam_rating_count"
    t.integer "steam_app_id"
    t.string "thumbnail"
    t.decimal "sale_price"
    t.decimal "normal_price"
    t.string "savings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_summary_id"], name: "index_cheap_games_on_game_summary_id"
  end

  create_table "free_games", force: :cascade do |t|
    t.integer "summary_id"
    t.string "title"
    t.text "fdescription"
    t.string "url"
    t.string "genre"
    t.string "platform"
    t.string "publisher"
    t.date "release_date"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_summaries", force: :cascade do |t|
    t.string "summary_game_title"
    t.string "game_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "giveaways", force: :cascade do |t|
    t.integer "summary_id"
    t.string "title"
    t.string "worth"
    t.string "thumbnail"
    t.text "instructions"
    t.string "giveaway_url"
    t.string "platforms"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cheap_games", "game_summaries"
end
