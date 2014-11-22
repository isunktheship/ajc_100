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

ActiveRecord::Schema.define(version: 20141122061310) do

  create_table "beers", force: true do |t|
    t.string   "name"
    t.integer  "brewery_id"
    t.string   "style"
    t.decimal  "abv"
    t.decimal  "ibu"
    t.decimal  "beer_advocate_average"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  add_index "beers", ["brand_id"], name: "index_beers_on_brand_id"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breweries", force: true do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "homepage"
    t.integer  "brand_id"
  end

  add_index "breweries", ["brand_id"], name: "index_breweries_on_brand_id"

  create_table "brews", force: true do |t|
    t.integer  "brewery_id"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
