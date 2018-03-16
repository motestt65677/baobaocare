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

ActiveRecord::Schema.define(version: 20180316024615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.integer "doctor_id"
    t.index ["child_id"], name: "index_chatrooms_on_child_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mother_id"
    t.string "avatar"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chatroom_id"
    t.integer "user_id"
    t.index ["chatroom_id"], name: "index_comments_on_chatroom_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "document"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.string "age_group"
    t.index ["child_id"], name: "index_milestones_on_child_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chatroom_id"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.boolean "confirmed"
    t.time "end_time"
  end

  create_table "timeslots", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "qualifications"
    t.string "specialty"
    t.integer "experience_years"
    t.string "location"
    t.string "position"
    t.string "certified"
    t.integer "number_of_children"
    t.string "type"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "chatrooms", "children"
  add_foreign_key "comments", "chatrooms"
  add_foreign_key "milestones", "children"
end
