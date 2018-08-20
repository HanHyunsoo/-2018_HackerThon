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

ActiveRecord::Schema.define(version: 20180819133005) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "board_id"
    t.string   "img",        default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "assign_requests", force: :cascade do |t|
    t.text     "content"
    t.integer  "s_id"
    t.integer  "c_id"
    t.integer  "g_private"
    t.string   "img_url",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "assign_requests_categories", force: :cascade do |t|
    t.integer "assign_request_id"
    t.integer "category_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"
  add_index "relationships", ["following_id"], name: "index_relationships_on_following_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "name",                                 null: false
    t.string   "mail",                                 null: false
    t.string   "authorization",          default: "2"
    t.string   "business_number"
    t.string   "phone_number",                         null: false
    t.string   "address",                              null: false
    t.string   "postcode"
    t.string   "details"
    t.string   "extra_info"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
