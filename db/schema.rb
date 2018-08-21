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

ActiveRecord::Schema.define(version: 20180821123606) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "board_id"
    t.string   "img",        default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "assign_request_comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "u_id"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "autorities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "goods", force: :cascade do |t|
    t.integer  "s_id"
    t.integer  "c_id"
    t.string   "price"
    t.string   "image_url"
    t.text     "content"
    t.integer  "ar_private"
    t.integer  "ar_order_id"
    t.integer  "ur_order_id"
    t.integer  "ur_private"
    t.integer  "ar_category_id"
    t.integer  "ur_category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "img"
    t.text     "content"
    t.integer  "g_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_comfirms", force: :cascade do |t|
    t.string   "price"
    t.integer  "request_id"
    t.integer  "c_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "request_statuses", force: :cascade do |t|
    t.integer  "g_id"
    t.integer  "g_s_id"
    t.integer  "g_c_id"
    t.integer  "status_id"
    t.string   "status_img"
    t.text     "status_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "g_id"
    t.text     "content"
    t.string   "img"
    t.integer  "g_s_id"
    t.integer  "g_c_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seller_pages", force: :cascade do |t|
    t.integer  "s_id"
    t.string   "s_img"
    t.string   "s_introduce"
    t.integer  "s_port_id"
    t.integer  "s_review_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unassign_request_comments", force: :cascade do |t|
    t.string   "price"
    t.text     "content"
    t.integer  "s_id"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unassign_requests", force: :cascade do |t|
    t.string   "img"
    t.text     "content"
    t.integer  "pick_s_id"
    t.integer  "c_id"
    t.integer  "c_check"
    t.integer  "g_private"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "name",                                 null: false
    t.string   "mail",                                 null: false
    t.string   "authorization",          default: "3"
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
