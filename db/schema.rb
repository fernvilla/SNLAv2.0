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

ActiveRecord::Schema.define(version: 20140609012422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "angels", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", force: true do |t|
    t.text     "title"
    t.datetime "published"
    t.string   "source"
    t.string   "team"
    t.text     "url"
    t.datetime "date_bookmarked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "bruins", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chivas", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clippers", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dodgers", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ducks", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galaxies", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kings", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lakers", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preps", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sparks", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trojans", force: true do |t|
    t.text     "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "published"
    t.string   "image"
    t.string   "source"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
