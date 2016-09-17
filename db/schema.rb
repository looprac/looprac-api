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

ActiveRecord::Schema.define(version: 20160917155518) do

  create_table "drivers", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "origin_name",      limit: 255
    t.string   "dest_name",        limit: 255
    t.string   "origin_latitude",  limit: 255
    t.string   "origin_longitude", limit: 255
    t.string   "dest_latitude",    limit: 255
    t.string   "dest_longitude",   limit: 255
    t.integer  "departure_time",   limit: 4
    t.integer  "arrival_time",     limit: 4
    t.integer  "capacity",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "origin_name",      limit: 255
    t.string   "dest_name",        limit: 255
    t.string   "origin_latitude",  limit: 255
    t.string   "origin_longitude", limit: 255
    t.string   "dest_latitude",    limit: 255
    t.string   "dest_longitude",   limit: 255
    t.integer  "departure_time",   limit: 4
    t.integer  "arrival_time",     limit: 4
    t.integer  "driver_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "passengers", ["driver_id"], name: "index_passengers_on_driver_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uuid",                   limit: 36
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "passengers", "drivers"
end
