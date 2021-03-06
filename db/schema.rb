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

ActiveRecord::Schema.define(version: 20180413231654) do

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "menus_appeared"
    t.integer "times_appeared"
    t.date "first_appeared"
    t.date "last_appeared"
    t.float "lowest_price"
    t.float "highest_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "menu_page_id"
    t.float "price"
    t.float "high_price"
    t.integer "dish_id"
    t.float "xpos"
    t.float "ypos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menu_items_on_dish_id"
    t.index ["menu_page_id"], name: "index_menu_items_on_menu_page_id"
  end

  create_table "menu_pages", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "page_number"
    t.bigint "image_id"
    t.integer "full_height"
    t.integer "full_width"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_pages_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "sponsor"
    t.string "event"
    t.string "venue"
    t.string "place"
    t.string "physical_description"
    t.string "occasion"
    t.string "notes"
    t.string "call_number"
    t.string "keywords"
    t.string "language"
    t.datetime "date"
    t.string "location"
    t.string "location_type"
    t.string "currency"
    t.string "currency_symbol"
    t.string "status"
    t.integer "page_count"
    t.integer "dish_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
