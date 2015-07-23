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

ActiveRecord::Schema.define(version: 20150723081439) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "number",     limit: 4,   null: false
    t.integer  "apt_number", limit: 4
    t.string   "street",     limit: 255, null: false
    t.string   "city",       limit: 255, null: false
    t.integer  "zipcode",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "addresses_customers", force: :cascade do |t|
    t.integer "address_id",  limit: 4
    t.integer "customer_id", limit: 4
  end

  create_table "customers", force: :cascade do |t|
    t.string   "last_name",       limit: 255,   null: false
    t.string   "first_name",      limit: 255
    t.string   "primary_phone",   limit: 255,   null: false
    t.string   "secondary_phone", limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.binary   "notes",           limit: 65535
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "state",       limit: 255
    t.string   "total_time",  limit: 255
    t.string   "total_labor", limit: 255
    t.string   "total_parts", limit: 255
    t.string   "tax",         limit: 255
    t.string   "total_cost",  limit: 255
    t.string   "notes",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.binary   "request",     limit: 65535
    t.integer  "customer_id", limit: 4,     null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "time",          limit: 4,     null: false
    t.string   "notes",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.binary   "description",   limit: 65535, null: false
    t.integer  "technician_id", limit: 4
  end

end
