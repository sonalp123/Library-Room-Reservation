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

ActiveRecord::Schema.define(version: 20161005224531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_histories", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "username"
    t.integer  "room_num"
    t.integer  "start_t"
    t.integer  "end_t"
    t.date     "date"
    t.string   "building"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_rooms", force: :cascade do |t|
    t.integer  "number"
    t.string   "building"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifs", force: :cascade do |t|
    t.string   "username"
    t.text     "message"
    t.date     "date"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sender"
    t.integer  "booking_id"
  end

  create_table "users", primary_key: "username", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "role"
    t.string   "password_digest"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "string"
  end

  add_foreign_key "booking_histories", "library_rooms", column: "room_num"
  add_foreign_key "booking_histories", "users", column: "username", primary_key: "username"
end
