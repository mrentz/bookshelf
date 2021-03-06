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

ActiveRecord::Schema.define(version: 20171120063648) do

  create_table "admins", force: :cascade do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "string"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.index ["login"], name: "index_admins_on_login", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "thoughts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "admin_id"
    t.index ["admin_id"], name: "index_books_on_admin_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.string   "author"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
  end

end
