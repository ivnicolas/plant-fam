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

ActiveRecord::Schema.define(version: 2021_04_25_220617) do

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "sunlight_needs"
    t.string "watering_needs"
    t.string "best_environment"
  end

  create_table "user_plants", force: :cascade do |t|
    t.string "list"
    t.integer "plant_id"
    t.integer "user_id"
    t.string "plant_nickname"
    t.string "size"
    t.string "notes_on_tending"
    t.boolean "has_been_watered"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "password_digest"
  end

end
