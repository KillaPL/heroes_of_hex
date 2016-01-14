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

ActiveRecord::Schema.define(version: 20160114205629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.boolean  "public",              default: true
    t.integer  "point_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "communication_token"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "points_limit"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "army_id"
    t.integer  "user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.datetime "alive_until"
  end

  create_table "troops", id: false, force: :cascade do |t|
    t.integer "unit_id"
    t.integer "roster_id"
    t.integer "unit_size"
    t.integer "total_price"
  end

  add_index "troops", ["roster_id"], name: "index_troops_on_roster_id", using: :btree
  add_index "troops", ["unit_id"], name: "index_troops_on_unit_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.string   "slot"
    t.integer  "speed"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "damage_min"
    t.integer  "damage_max"
    t.integer  "hp"
    t.integer  "ammunition"
    t.integer  "shooting_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "army_id"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
