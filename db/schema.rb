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

ActiveRecord::Schema.define(version: 20140404220408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "issues", force: true do |t|
    t.text     "title"
    t.text     "html_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: true do |t|
    t.integer  "gh_id"
    t.string   "name"
    t.boolean  "fork"
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repositories", ["account_id"], name: "index_repositories_on_account_id", using: :btree
  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.string   "nickname"
    t.string   "email"
    t.string   "token"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webhooks", force: true do |t|
    t.integer  "user_id"
    t.integer  "repository_id"
    t.integer  "gh_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "webhooks", ["repository_id"], name: "index_webhooks_on_repository_id", using: :btree
  add_index "webhooks", ["user_id"], name: "index_webhooks_on_user_id", using: :btree

end
