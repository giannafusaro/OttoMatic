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

ActiveRecord::Schema.define(version: 20150808034046) do

  create_table "addresses", force: :cascade do |t|
    t.string   "city",       limit: 255, null: false
    t.integer  "zipcode",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "street_1",   limit: 255
    t.string   "street_2",   limit: 255
  end

  create_table "addresses_customers", force: :cascade do |t|
    t.integer "address_id",  limit: 4
    t.integer "customer_id", limit: 4
  end

  create_table "appliances", force: :cascade do |t|
    t.string   "brand",        limit: 255
    t.string   "model",        limit: 255
    t.integer  "serial",       limit: 8
    t.datetime "purchased_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "kind",         limit: 255
  end

  create_table "appliances_jobs", force: :cascade do |t|
    t.integer "appliances_id", limit: 4
    t.integer "jobs_id",       limit: 4
  end

  create_table "appliances_parts", force: :cascade do |t|
    t.integer "appliances_id", limit: 4
    t.integer "parts_id",      limit: 4
  end

  create_table "complaints", force: :cascade do |t|
    t.text     "complaint",      limit: 65535
    t.string   "appliance_kind", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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

  create_table "customers_jobs", force: :cascade do |t|
    t.integer "customer_id", limit: 4
    t.integer "job_id",      limit: 4
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "state",       limit: 255
    t.integer  "total_time",  limit: 4,                           default: 0
    t.decimal  "total_labor",             precision: 5, scale: 2, default: 0.0
    t.decimal  "total_parts",             precision: 5, scale: 2, default: 0.0
    t.decimal  "tax",                     precision: 5, scale: 2, default: 0.0
    t.decimal  "total_cost",              precision: 5, scale: 2, default: 0.0
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "number",     limit: 8
    t.decimal  "price",                precision: 5, scale: 2, default: 0.0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "technician_id", limit: 4
    t.integer  "job_id",        limit: 4,     null: false
    t.datetime "scheduled_for"
    t.binary   "complaint",     limit: 65535
    t.integer  "time_taken",    limit: 4
    t.binary   "summary",       limit: 65535
    t.integer  "complaint_id",  limit: 4
  end

end
