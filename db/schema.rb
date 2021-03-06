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

ActiveRecord::Schema.define(version: 2019_02_02_093128) do

  create_table "budges", force: :cascade do |t|
    t.string "budge_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outputs", force: :cascade do |t|
    t.date "date"
    t.integer "name_id"
    t.string "shop_name"
    t.integer "deposit"
    t.string "category"
    t.string "reason"
    t.string "memo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "withdrawal"
    t.string "revenue_item"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "monthly_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.integer "monthly_budget"
    t.integer "monthly_savings"
    t.string "thumbnail"
    t.string "background"
    t.integer "total_asets"
  end

  create_table "usersbudges", force: :cascade do |t|
    t.integer "user_id"
    t.integer "budge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
