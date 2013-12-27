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

ActiveRecord::Schema.define(version: 20131227043242) do

  create_table "houses", force: true do |t|
    t.string   "address",      limit: 500,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offers_count",             default: 0, null: false
  end

  add_index "houses", ["address"], name: "index_houses_on_address", unique: true

  create_table "offers", force: true do |t|
    t.integer  "house_id",                default: 0, null: false
    t.integer  "user_id",                 default: 0, null: false
    t.integer  "amount",                  default: 0, null: false
    t.datetime "offered_at",                          null: false
    t.datetime "replied_at",                          null: false
    t.string   "reason",     limit: 1024,             null: false
    t.string   "mls"
    t.string   "agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["house_id", "user_id"], name: "index_offers_on_house_id_and_user_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

end
