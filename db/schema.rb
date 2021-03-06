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

ActiveRecord::Schema.define(version: 20170209181212) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.integer  "active",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "airlines", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "email",       limit: 255
    t.integer  "hotel_id",    limit: 4
    t.string   "single",      limit: 255, default: "0"
    t.string   "double",      limit: 255, default: "0"
    t.date     "datein"
    t.date     "dateout"
    t.string   "flight_type", limit: 255
    t.string   "airport",     limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "comments",    limit: 255
    t.integer  "status",      limit: 4,   default: 1
    t.string   "name",        limit: 255
    t.integer  "airline_id",  limit: 4
  end

  add_index "bookings", ["airline_id"], name: "index_bookings_on_airline_id", using: :btree
  add_index "bookings", ["hotel_id"], name: "index_bookings_on_hotel_id", using: :btree

  create_table "bookings_airlines", force: :cascade do |t|
    t.integer  "airline_id",  limit: 4
    t.integer  "hotel_id",    limit: 4
    t.integer  "single",      limit: 4
    t.integer  "double",      limit: 4
    t.date     "datein"
    t.date     "dateout"
    t.integer  "flight_type", limit: 4
    t.string   "comments",    limit: 255
    t.integer  "status",      limit: 4,   default: 1
    t.string   "airport",     limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "bookings_airlines", ["airline_id"], name: "index_bookings_airlines_on_airline_id", using: :btree
  add_index "bookings_airlines", ["hotel_id"], name: "index_bookings_airlines_on_hotel_id", using: :btree

  create_table "creditcards", force: :cascade do |t|
    t.string   "card_number",       limit: 255
    t.string   "name",              limit: 255
    t.integer  "zip_code",          limit: 4
    t.integer  "verification_code", limit: 4
    t.integer  "booking_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "creditcards", ["booking_id"], name: "index_creditcards_on_booking_id", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.integer  "single",       limit: 4
    t.integer  "double",       limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password",     limit: 255
    t.float    "price_single", limit: 24,  default: 0.0
    t.float    "price_double", limit: 24,  default: 0.0
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.integer  "status",     limit: 1,   default: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version",     limit: 255
    t.integer  "runtime",     limit: 4
    t.datetime "migrated_on"
  end

  add_foreign_key "bookings", "airlines"
  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings_airlines", "airlines"
  add_foreign_key "bookings_airlines", "hotels"
  add_foreign_key "creditcards", "bookings"
end
