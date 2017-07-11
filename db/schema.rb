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

ActiveRecord::Schema.define(version: 20170710221805) do

  create_table "attributes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_attributes", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "attribute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "card_attributes", ["attribute_id"], name: "index_card_attributes_on_attribute_id"
  add_index "card_attributes", ["card_id"], name: "index_card_attributes_on_card_id"

  create_table "card_manufacturer_cards", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "card_manufacturer_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "card_manufacturer_cards", ["card_id"], name: "index_card_manufacturer_cards_on_card_id"
  add_index "card_manufacturer_cards", ["card_manufacturer_id"], name: "index_card_manufacturer_cards_on_card_manufacturer_id"

  create_table "card_manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_players", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "card_players", ["card_id"], name: "index_card_players_on_card_id"
  add_index "card_players", ["player_id"], name: "index_card_players_on_player_id"

  create_table "card_teams", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "card_teams", ["card_id"], name: "index_card_teams_on_card_id"
  add_index "card_teams", ["team_id"], name: "index_card_teams_on_team_id"

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "front_image_url"
    t.string   "back_image_url"
    t.integer  "available"
    t.string   "serial_number"
    t.string   "sku"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "purchased",  default: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "checklists", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "content"
    t.string   "layout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
