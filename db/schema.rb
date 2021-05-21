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

ActiveRecord::Schema.define(version: 2021_05_21_115601) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recommend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommend_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recommend_id"
    t.text "recommend_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommends", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "outher"
    t.string "publisher"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "following_id"
    t.integer "followed_id"
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "study_times", force: :cascade do |t|
    t.integer "user_id"
    t.integer "year"
    t.integer "month"
    t.integer "date"
    t.integer "hour"
    t.integer "min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.boolean "is_active", default: false
    t.text "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
