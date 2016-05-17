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

ActiveRecord::Schema.define(version: 20160517214441) do

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "artist",         default: "unkown"
    t.integer  "user_id"
    t.integer  "num_votes",      default: 0
    t.string   "embeddable_url"
  end

  create_table "upvotes", id: false, force: :cascade do |t|
    t.integer "track_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "upvotes", ["track_id"], name: "index_upvotes_on_track_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
